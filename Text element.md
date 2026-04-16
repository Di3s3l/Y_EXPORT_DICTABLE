# Y_EXPORT_DICTABLE — Text Elements

Maintain in **SE38 → Goto → Text Elements** (or **SE32**).  
After uploading the source to a new system, recreate all entries below before executing the report.

---

## Text Symbols
*SE38 → Goto → Text Elements → Text Symbols*

### Selection screen

| Symbol | Max Len | Value |
|--------|---------|-------|
| `001`  | 40      | `Export DDIC Table Structure` |
| `S01`  | 70      | `Exports the DDIC structure of a table to a semicolon-separated CSV file.` |
| `S02`  | 70      | `Separator: semicolon (;)   Encoding: UTF-8 with BOM` |
| `D01`  | 100     | `C:\TEMP\` |
| `D02`  | 50      | `export.csv` |

### CSV column headers (one symbol per column)

If a symbol is blank or not maintained, that column header falls back to `NONAME` automatically.

| Symbol | Max Len | CSV Column        |
|--------|---------|-------------------|
| `H01`  | 10      | `FIELD_NAME`      |
| `H02`  | 12      | `DATA_ELEMENT`    |
| `H03`  | 9       | `DDIC_TYPE`       |
| `H04`  | 6       | `LENGTH`          |
| `H05`  | 8       | `DECIMALS`        |
| `H06`  | 11      | `DESCRIPTION`     |
| `H07`  | 7       | `INCLUDE`         |

### Messages

| Symbol | Type    | Value |
|--------|---------|-------|
| `M01`  | Popup   | `Table not found or not active.` |
| `M02`  | Popup   | `Cannot read table field structure.` |
| `M03`  | Popup   | `Cannot read include structure map.` |
| `M04`  | Popup   | `Export completed successfully.` |
| `M05`  | Popup   | `File download failed.` |

---

## Selection Texts
*SE38 → Goto → Text Elements → Selection Texts*

| Parameter | Text |
|-----------|------|
| `P_TAB`   | `Table Name` |
| `P_FILE`  | `Output File` |

---

## Usage Reference

| Symbol     | Location in code                                              | Purpose                  |
|------------|---------------------------------------------------------------|--------------------------|
| `TEXT-001` | `SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001` | Block frame title        |
| `TEXT-S01` | `SELECTION-SCREEN COMMENT 1(70) TEXT-s01`                    | Info-box line 1          |
| `TEXT-S02` | `SELECTION-SCREEN COMMENT 1(70) TEXT-s02`                    | Info-box line 2          |
| `TEXT-H01`–`H07` | CSV header assembly                                   | One label per column     |
| `TEXT-D01` | `INITIALIZATION: p_file = TEXT-d01 && TEXT-d02`               | Default output path      |
| `TEXT-D02` | `INITIALIZATION: p_file = TEXT-d01 && TEXT-d02`               | Default output filename  |
| `TEXT-M01` | `MESSAGE TEXT-m01 TYPE 'E'`                                   | Table not found          |
| `TEXT-M02` | `MESSAGE TEXT-m02 TYPE 'E'`                                   | Field metadata read fail |
| `TEXT-M03` | `MESSAGE TEXT-m03 TYPE 'W'`                                   | Include map read fail    |
| `TEXT-M04` | `MESSAGE TEXT-m04 TYPE 'S'`                                   | Export success           |
| `TEXT-M05` | `MESSAGE TEXT-m05 TYPE 'E'`                                   | Download fail            |
