# Y_EXPORT_DICTABLE

<img src="assets/sap-s4hana-logo.png" alt="SAP S/4HANA" width="200"/>

SAP ABAP report that exports the field structure of any transparent DDIC table to a UTF-8 semicolon-delimited CSV file on the frontend workstation.

---

## Features

- Exports all fields of a transparent table with full DDIC metadata
- Resolves source include structure for each field
- UTF-8 output with BOM (Excel-compatible)
- All UI labels and messages configurable via SE32 — no source edit required
- Column headers fall back to `NONAME` if text elements are not maintained

---

## Documentation

| Document | Description |
|----------|-------------|
| [Installation](docs/installation.md) | How to install and configure the report |
| [Usage](docs/usage.md) | How to run the report |
| [CSV Output](docs/csv-output.md) | Output format and column reference |
| [Text Elements](docs/text-elements-guide.md) | All SE32 text symbols and selection texts |
| [Technical Notes](docs/technical-notes.md) | DDIC APIs, design decisions, requirements |

---

## Files

| File | Description |
|------|-------------|
| `src/Y_EXPORT_DICTABLE.abap` | ABAP source |
| `src/text-element.md` | Text elements — copy values from here into SE32 |
| `docs/` | Full documentation |

---

## License & Copyright

Copyright © 2026 <a href="https://enz.ovh" target="_blank">Di3s3l</a>

Personal use and internal corporate use permitted. Redistribution or publication of modified versions requires attribution to the original author.
