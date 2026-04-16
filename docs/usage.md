# Usage

← [Documentation](README.md) | 🇮🇹 [Versione italiana](it/usage.md)

## Running the Report

1. Execute the report in SE38 or via transaction (**F8**)
2. Enter the **table name** (e.g. `MARA`, `KNA1`, `VBAK`)
3. Enter the **output file path** — defaults to the value set in text elements `D01` + `D02`
   - Use the **F4** button to browse the local filesystem
4. Press **Execute (F8)** — the CSV is downloaded to the frontend workstation

## Messages

All messages appear as popup dialogs.

| Message | Type | Trigger |
|---------|------|---------|
| M01 | Error | Table not found or not active in DDIC |
| M02 | Error | Field metadata could not be read |
| M03 | Warning | Include structure map could not be read (export continues) |
| M04 | Info | Export completed successfully |
| M05 | Error | File download failed |

## Notes

- The report runs only with an active SAP GUI connection (uses `GUI_DOWNLOAD` — not compatible with background jobs)
- Output encoding is always UTF-8 with BOM regardless of logon language
- Field descriptions are resolved in the **logon language**
