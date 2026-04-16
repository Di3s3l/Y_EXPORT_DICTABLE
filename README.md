# Y_EXPORT_DICTABLE

<img src="assets/sap-s4hana-logo.png" alt="SAP S/4HANA" width="200"/>

![Version](https://img.shields.io/badge/version-1.0-blue) ![ABAP](https://img.shields.io/badge/ABAP-7.40%2B-brightgreen)

🇮🇹 [Versione italiana](README.it.md)

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

The [`docs/`](docs/README.md) folder contains installation instructions, usage guide, CSV output reference, text elements guide, and technical notes.

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
