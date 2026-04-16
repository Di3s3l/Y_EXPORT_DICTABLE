*&---------------------------------------------------------------------*
*& Report Y_EXPORT_DICTABLE
*& Exports the field structure of a DDIC table to a CSV file (frontend).
*& Separator: semicolon (;). Columns: field name, data element, DDIC
*& type, length, decimals, description, source include.
*&---------------------------------------------------------------------*
REPORT y_export_dictable.

" Map entry: field name → source include structure name
TYPES: BEGIN OF ty_incl_map,
         fieldname TYPE fieldname,
         include   TYPE tabname,
       END OF ty_incl_map.

DATA: lt_csv_data TYPE TABLE OF string,
      lt_dfies    TYPE TABLE OF dfies,
      ls_dfies    TYPE dfies,
      lv_line     TYPE string,
      lv_descr    TYPE string,         " local copy to avoid side effects on work area
      lt_incl_map TYPE HASHED TABLE OF ty_incl_map
                    WITH UNIQUE KEY fieldname. " fieldname → include lookup

" Info-box: two comment lines displayed above the input block.
" TEXT-S01 / TEXT-S02 must be set in SE32 (Text symbols tab).
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT 1(70) TEXT-s01.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT 1(70) TEXT-s02.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN SKIP.

" Input block — TEXT-001 = block frame title (SE32, Text symbols tab).
" Parameter labels are set in SE32, Selection texts tab.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_tab  TYPE tabname   OBLIGATORY,
              p_file TYPE localfile OBLIGATORY DEFAULT 'C:\TEMP\export.csv'.
SELECTION-SCREEN END OF BLOCK b1.

*----------------------------------------------------------------------*
* F4 help for output file path
*----------------------------------------------------------------------*
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  CALL FUNCTION 'KD_GET_FILENAME_ON_F4'
    EXPORTING
      static    = 'X'
    CHANGING
      file_name = p_file.

*----------------------------------------------------------------------*
* Main processing
*----------------------------------------------------------------------*
START-OF-SELECTION.

  " Validate: table must exist and be in active state (AS4LOCAL = 'A').
  " TEXT-M01: error shown when table is not found or not active.
  SELECT SINGLE tabname
    FROM dd02l
    INTO @DATA(lv_check)
    WHERE tabname = @p_tab
      AND as4local = 'A'.

  IF sy-subrc <> 0.
    MESSAGE TEXT-m01 TYPE 'E'.
    RETURN.
  ENDIF.

  " Retrieve field metadata for the table in the logon language.
  " DDIF_FIELDINFO_GET returns a flattened DFIES table — .INCLUDE marker rows
  " are NOT present. Descriptions and DDIC types are resolved here.
  " TEXT-M02: error shown when field metadata cannot be read.
  CALL FUNCTION 'DDIF_FIELDINFO_GET'
    EXPORTING
      tabname   = p_tab
      langu     = sy-langu
    TABLES
      dfies_tab = lt_dfies
    EXCEPTIONS
      not_found      = 1
      internal_error = 2
      OTHERS         = 3.

  IF sy-subrc <> 0.
    MESSAGE TEXT-m02 TYPE 'E'.
    RETURN.
  ENDIF.

  " Build field→include map via DDIF_TABL_GET.
  " DD03L/DD03P do not populate ROLLNAME for .INCLUDE marker rows (COMPTYPE = 'S').
  " The include structure name is carried in PRECFIELD of DD03P_TAB returned by
  " DDIF_TABL_GET, which is the only reliable API source for this mapping.
  " TEXT-M03: warning shown when include structure cannot be read (non-blocking).
  DATA lt_dd03p TYPE TABLE OF dd03p.

  CALL FUNCTION 'DDIF_TABL_GET'
    EXPORTING
      name          = p_tab
      langu         = sy-langu
    TABLES
      dd03p_tab     = lt_dd03p
    EXCEPTIONS
      illegal_input = 1
      OTHERS        = 2.

  IF sy-subrc <> 0.
    MESSAGE TEXT-m03 TYPE 'W'.
  ENDIF.

  DATA(lv_active_include) = CONV tabname( '' ).

  " Iterate DD03P in position order (guaranteed by DDIF_TABL_GET).
  " .INCLUDE marker rows have COMPTYPE='S' and carry the include structure name
  " in PRECFIELD (ROLLNAME is empty in both DD03L and DD03P for these rows).
  LOOP AT lt_dd03p INTO DATA(ls_dd03p).
    IF ls_dd03p-fieldname CP '.*'.
      lv_active_include = ls_dd03p-precfield.
    ELSEIF ls_dd03p-fieldname IS NOT INITIAL.
      INSERT VALUE #( fieldname = ls_dd03p-fieldname
                      include   = lv_active_include )
        INTO TABLE lt_incl_map.
    ENDIF.
  ENDLOOP.

  " Build CSV header from one symbol per column (H01–H07).
  " TEXT-hxx are C-type fields; CONV string() + CONDENSE strips trailing spaces.
  " COND result type must be string — without it the C(6) literal 'NONAME' would
  " infer C(6) for the entire expression, silently truncating every column label.
  " Any symbol not maintained in SE32 falls back to 'NONAME'.
  DATA(lv_h01) = CONV string( TEXT-h01 ).
  DATA(lv_h02) = CONV string( TEXT-h02 ).
  DATA(lv_h03) = CONV string( TEXT-h03 ).
  DATA(lv_h04) = CONV string( TEXT-h04 ).
  DATA(lv_h05) = CONV string( TEXT-h05 ).
  DATA(lv_h06) = CONV string( TEXT-h06 ).
  DATA(lv_h07) = CONV string( TEXT-h07 ).
  CONDENSE lv_h01. CONDENSE lv_h02. CONDENSE lv_h03. CONDENSE lv_h04.
  CONDENSE lv_h05. CONDENSE lv_h06. CONDENSE lv_h07.

  lv_line = |{ COND string( WHEN lv_h01 IS INITIAL THEN `NONAME` ELSE lv_h01 ) };| &&
            |{ COND string( WHEN lv_h02 IS INITIAL THEN `NONAME` ELSE lv_h02 ) };| &&
            |{ COND string( WHEN lv_h03 IS INITIAL THEN `NONAME` ELSE lv_h03 ) };| &&
            |{ COND string( WHEN lv_h04 IS INITIAL THEN `NONAME` ELSE lv_h04 ) };| &&
            |{ COND string( WHEN lv_h05 IS INITIAL THEN `NONAME` ELSE lv_h05 ) };| &&
            |{ COND string( WHEN lv_h06 IS INITIAL THEN `NONAME` ELSE lv_h06 ) };| &&
            |{ COND string( WHEN lv_h07 IS INITIAL THEN `NONAME` ELSE lv_h07 ) }|.
  APPEND lv_line TO lt_csv_data.

  LOOP AT lt_dfies INTO ls_dfies
    WHERE fieldname IS NOT INITIAL.

    " Copy description to a local variable to avoid mutating the work area.
    " Replace any semicolons in the description to preserve CSV structure.
    lv_descr = ls_dfies-fieldtext.
    REPLACE ALL OCCURRENCES OF ';' IN lv_descr WITH ','.

    " Look up the source include for this field; default to empty if not found.
    DATA(lv_include) = CONV tabname( '' ).
    READ TABLE lt_incl_map
      WITH TABLE KEY fieldname = ls_dfies-fieldname
      INTO DATA(ls_incl_map).
    IF sy-subrc = 0.
      lv_include = ls_incl_map-include.
    ENDIF.

    " Build the CSV row: field;data_element;type;length;decimals;description;include
    " CONV i() strips leading zeros from packed/NUMC length and decimals fields.
    lv_line = |{ ls_dfies-fieldname };{ ls_dfies-rollname };{ ls_dfies-datatype };| &&
              |{ CONV i( ls_dfies-leng ) };{ CONV i( ls_dfies-decimals ) };{ lv_descr };{ lv_include }|.

    APPEND lv_line TO lt_csv_data.

  ENDLOOP.

  " Download CSV to the frontend workstation.
  " CODEPAGE '4110' = UTF-8, ensures correct rendering of special characters.
  " TEXT-M04: success message. TEXT-M05: error on download failure.
  DATA(lv_filename) = CONV string( p_file ).

  CALL FUNCTION 'GUI_DOWNLOAD'
    EXPORTING
      filename                = lv_filename
      filetype                = 'ASC'
      codepage                = '4110'
      write_bom               = 'X'
    TABLES
      data_tab                = lt_csv_data
    EXCEPTIONS
      file_write_error        = 1
      no_batch                = 2
      gui_refuse_filetransfer = 3
      OTHERS                  = 4.

  IF sy-subrc = 0.
    MESSAGE TEXT-m04 TYPE 'S'.
  ELSE.
    MESSAGE TEXT-m05 TYPE 'E'.
  ENDIF.
