# Y_EXPORT_DICTABLE

SAP ABAP report that exports the field structure of any transparent DDIC table to a UTF-8 CSV file on the frontend workstation.

---

## Features

- Exports all fields of a transparent table with full DDIC metadata
- Resolves source include structure for each field
- UTF-8 output with BOM (Excel-compatible)
- Semicolon-delimited CSV
- All UI labels and messages configurable via SE32 text elements — no source edit required
- Column headers fall back to `NONAME` if text elements are not maintained

## CSV Output Format

| Column | Source |
|--------|--------|
| `FIELD_NAME` | `DFIES-FIELDNAME` |
| `DATA_ELEMENT` | `DFIES-ROLLNAME` |
| `DDIC_TYPE` | `DFIES-DATATYPE` |
| `LENGTH` | `DFIES-LENG` |
| `DECIMALS` | `DFIES-DECIMALS` |
| `DESCRIPTION` | `DFIES-FIELDTEXT` (logon language) |
| `INCLUDE` | `DD03P-PRECFIELD` (source include structure) |

---

## Installation

1. Open **SE38** in your SAP system
2. Create program `Y_EXPORT_DICTABLE`, assign to package **$TMP** (local, no transport required)
3. Upload source: **Utilities → Upload/Download → Upload**
4. Activate: **Ctrl+F3**
5. Maintain text elements in **SE38 → Goto → Text Elements** — see [`Y_EXPORT_DICTABLE_TXT_ELEMENT.md`](Y_EXPORT_DICTABLE_TXT_ELEMENT.md)

> Text elements are **not** embedded in the `.abap` source file. They must be recreated manually in each target system after upload.

---

## Usage

1. Execute the report (**F8**)
2. Enter the table name (e.g. `MARA`, `KNA1`, `VBAK`)
3. Enter the output file path (default: `C:\TEMP\export.csv`)
   - Use the F4 button to browse the local filesystem
4. Execute — the CSV is downloaded to the frontend workstation

---

## Technical Notes

| Topic | Detail |
|-------|--------|
| DDIC API | `DDIF_FIELDINFO_GET` for field metadata (flat, no `.INCLUDE` marker rows) |
| Include map | `DDIF_TABL_GET` → `DD03P_TAB`; include name read from `PRECFIELD` (not `ROLLNAME`) |
| Download | `GUI_DOWNLOAD`, `CODEPAGE='4110'` (UTF-8), `WRITE_BOM='X'` |
| Package | `$TMP` — local, non-transportable, no Basis involvement |
| Min. ABAP release | 7.40 (inline declarations, string templates, `COND`) |

---

## Text Elements

Full reference in [`Y_EXPORT_DICTABLE_TXT_ELEMENT.md`](Y_EXPORT_DICTABLE_TXT_ELEMENT.md).

| Symbol | Purpose |
|--------|---------|
| `001` | Selection screen block title |
| `S01`–`S02` | Info-box description lines |
| `H01`–`H07` | CSV column headers (one per column) |
| `M01`–`M05` | Runtime messages (errors, warning, success) |

---

## Files

| File | Description |
|------|-------------|
| `Y_EXPORT_DICTABLE.abap` | ABAP source |
| `Y_EXPORT_DICTABLE_TXT_ELEMENT.md` | Text elements reference |

---

## License & Copyright

Copyright © 2025 [Di3s3l](https://enz.ovh)

Personal use and internal corporate use permitted. Redistribution or publication of modified versions requires attribution to the original author.
