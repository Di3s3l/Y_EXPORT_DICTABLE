# Y_EXPORT_DICTABLE — Text Elements Guide

Maintain in **SE38 → Goto → Text Elements** (or **SE32**).  
After uploading the source to a new system, recreate all entries below before executing the report.

The authoritative value list is in [`src/text-element.md`](../src/text-element.md).

---

## Text Symbols
*SE38 → Goto → Text Elements → Text Symbols*

### Selection screen

| Symbol | Max Len | Value |
|--------|---------|-------|
| `001`  | 40      | `Export DDIC Table Structure` |
| `S01`  | 100     | `Exports the DDIC structure of a table to a semicolon-separated CSV file.` |
| `S02`  | 100     | `Separator: semicolon (;)   Encoding: UTF-8 with BOM` |
| `D01`  | 100     | `C:\TEMP\` |
| `D02`  | 50      | `export.csv` |

### CSV column headers (one symbol per column)

If a symbol is blank or not maintained, that column header falls back to `NONAME` automatically.

| Symbol | Max Len | Value |
|--------|---------|-------|
| `H01`  | 30      | `FIELD_NAME` |
| `H02`  | 30      | `DATA_ELEMENT` |
| `H03`  | 30      | `DDIC_TYPE` |
| `H04`  | 30      | `LENGTH` |
| `H05`  | 30      | `DECIMALS` |
| `H06`  | 30      | `DESCRIPTION` |
| `H07`  | 30      | `INCLUDE` |

### Messages

| Symbol | Max Len | Value |
|--------|---------|-------|
| `M01`  | 100     | `Table not found or not active.` |
| `M02`  | 100     | `Cannot read table field structure.` |
| `M03`  | 100     | `Cannot read include structure map.` |
| `M04`  | 100     | `Export completed successfully.` |
| `M05`  | 100     | `File download failed.` |

---

## Selection Texts
*SE38 → Goto → Text Elements → Selection Texts*

| Parameter | Text |
|-----------|------|
| `P_TAB`   | `Table Name` |
| `P_FILE`  | `Output File` |

---

## Usage Reference

| Symbol | Location in code | Purpose |
|--------|-----------------|---------|
| `TEXT-001` | `SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001` | Block frame title |
| `TEXT-S01` | `SELECTION-SCREEN COMMENT 1(70) TEXT-s01` | Info-box line 1 |
| `TEXT-S02` | `SELECTION-SCREEN COMMENT 1(70) TEXT-s02` | Info-box line 2 |
| `TEXT-D01` | `INITIALIZATION: p_file = TEXT-d01 && TEXT-d02` | Default output path |
| `TEXT-D02` | `INITIALIZATION: p_file = TEXT-d01 && TEXT-d02` | Default output filename |
| `TEXT-H01`–`H07` | CSV header assembly | One label per column |
| `TEXT-M01` | `MESSAGE TEXT-m01 TYPE 'I'` | Table not found |
| `TEXT-M02` | `MESSAGE TEXT-m02 TYPE 'I'` | Field metadata read fail |
| `TEXT-M03` | `MESSAGE TEXT-m03 TYPE 'I'` | Include map read fail |
| `TEXT-M04` | `MESSAGE TEXT-m04 TYPE 'I'` | Export success |
| `TEXT-M05` | `MESSAGE TEXT-m05 TYPE 'I'` | Download fail |
