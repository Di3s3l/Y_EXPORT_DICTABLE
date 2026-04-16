# CSV Output Format

🇮🇹 [Versione italiana](it/csv-output.md)

## Structure

- Separator: **semicolon** (`;`)
- Encoding: **UTF-8 with BOM**
- First row: column headers (configurable via text elements H01–H07)
- One row per field, excluding `.INCLUDE` marker rows

## Columns

| # | Default Header | Source Field | Notes |
|---|---------------|--------------|-------|
| 1 | `FIELD_NAME` | `DFIES-FIELDNAME` | Technical field name |
| 2 | `DATA_ELEMENT` | `DFIES-ROLLNAME` | Associated data element |
| 3 | `DDIC_TYPE` | `DFIES-DATATYPE` | DDIC base type (CHAR, NUMC, DATS…) |
| 4 | `LENGTH` | `DFIES-LENG` | Field length (numeric, no leading zeros) |
| 5 | `DECIMALS` | `DFIES-DECIMALS` | Decimal places (numeric, no leading zeros) |
| 6 | `DESCRIPTION` | `DFIES-FIELDTEXT` | Field label in logon language |
| 7 | `INCLUDE` | `DD03P-PRECFIELD` | Source include structure name |

## Notes

- Semicolons in field descriptions are automatically replaced with commas to preserve CSV structure
- The `INCLUDE` column is empty for fields defined directly on the table (not via an include)
- Column headers are individually configurable via text elements H01–H07; unmaintained symbols fall back to `NONAME`
