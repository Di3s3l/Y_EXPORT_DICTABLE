# TODO

## Alta priorità

### 8 — ALV Preview
Show the table structure in an ALV grid before downloading the CSV.
The user can review the output, deselect rows, or cancel without writing to disk.

- Add a checkbox parameter `P_PREV` on the selection screen ("Preview before export")
- If checked, display `lt_csv_data` (or a structured internal table) via `CL_SALV_TABLE`
- Export only after user confirms from the ALV toolbar

---

### 1 — Field Filter
Allow the user to exclude fields by name pattern or DDIC type from the selection screen.

- Add optional parameter `P_EXCL` (e.g. `MANDT,*_DATE`) — comma-separated list of field name patterns
- Add optional parameter `P_TYPE` — exclude by DDIC type (e.g. `CLNT`)
- Filter applied before building CSV rows

---

## Media priorità

### 2 — Multi-table Export
Accept a list of tables instead of a single one and export all in one run.

- Replace `p_tab` with a SELECT-OPTIONS range `s_tab`
- Option A: one CSV per table (file named after table)
- Option B: single CSV with additional column `TABLE_NAME` as first column
- Add parameter to choose between A and B

---

### 4 — Configurable Separator
Replace the hardcoded semicolon with a text element or parameter.

- Add parameter `P_SEP` with default from text element `D03`
- Apply `P_SEP` in the CSV row build and header assembly
- Update `GUI_DOWNLOAD` separator handling if needed
- Document new text element `D03` in `src/text-element.md`

---

## Note

- Items are independent — each can be implemented without the others
- ALV preview (8) and field filter (1) share no dependencies with multi-table (2) or separator (4)
- Multi-table (2) requires revisiting the `INITIALIZATION` path default filename logic
