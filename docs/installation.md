# Installation

← [Documentation](README.md) | 🇮🇹 [Versione italiana](it/installation.md)

## Requirements

- SAP system with ABAP release **7.40 or higher**
- Access to **SE38** (ABAP Editor)
- Access to **SE32** (ABAP Text Elements)
- Frontend workstation with SAP GUI (required for `GUI_DOWNLOAD`)

## Steps

1. Open **SE38** in your SAP system
2. Create program `Y_EXPORT_DICTABLE`
   - Package: **$TMP** (local, non-transportable — no Basis involvement, no transport request)
3. Upload source: **Utilities → Upload/Download → Upload** → select `src/Y_EXPORT_DICTABLE.abap`
4. Activate: **Ctrl+F3**
5. Maintain text elements: **SE38 → Goto → Text Elements** — see [Text Elements](text-elements-guide.md)

> Text elements are **not** embedded in the `.abap` source file. They must be recreated manually in each target system after upload.

## Package Strategy

Assigning to `$TMP` means the object is local to the system and never included in transport requests. Distribution across systems is done by uploading the source via SE38 — no Basis or CTS involvement required.
