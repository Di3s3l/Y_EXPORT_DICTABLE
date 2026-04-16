# Y_EXPORT_DICTABLE — Text Elements Reference

| Symbol | Max Len | Value |
|--------|---------|-------|
| `001`  | 40      | `Export DDIC Table Structure` |
| `S01`  | 100     | `Exports the DDIC structure of a table to a semicolon-separated CSV file.` |
| `S02`  | 100     | `Separator: semicolon (;)   Encoding: UTF-8 with BOM` |
| `D01`  | 100     | `C:\TEMP\` |
| `D02`  | 50      | `export.csv` |
| `H01`  | 30      | `FIELD_NAME` |
| `H02`  | 30      | `DATA_ELEMENT` |
| `H03`  | 30      | `DDIC_TYPE` |
| `H04`  | 30      | `LENGTH` |
| `H05`  | 30      | `DECIMALS` |
| `H06`  | 30      | `DESCRIPTION` |
| `H07`  | 30      | `INCLUDE` |
| `M01`  | 100     | `Table not found or not active.` |
| `M02`  | 100     | `Cannot read table field structure.` |
| `M03`  | 100     | `Cannot read include structure map.` |
| `M04`  | 100     | `Export completed successfully.` |
| `M05`  | 100     | `File download failed.` |
| `M06`  | 100     | `Insufficient authorization to read DDIC object.` |

**Selection Texts** — *SE38 → Goto → Text Elements → Selection Texts*

| Parameter | Text |
|-----------|------|
| `P_TAB`   | `Table Name` |
| `P_FILE`  | `Output File` |
