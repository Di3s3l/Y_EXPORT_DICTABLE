# Technical Notes

🇮🇹 [Versione italiana](it/technical-notes.md)

## Requirements

| Requirement | Detail |
|-------------|--------|
| Min. ABAP release | 7.40 (inline declarations, string templates, `COND`) |
| SAP GUI | Required — `GUI_DOWNLOAD` is a frontend function |
| Authorization | Read access to DD02L, DD03P (DDIC metadata tables) |
| Package | `$TMP` recommended — local, non-transportable |

## DDIC APIs

### `DDIF_FIELDINFO_GET`
Returns a flat `DFIES` table with all fields of the table resolved to their base types. `.INCLUDE` marker rows are **not** present — the table is already flattened. Used for field name, data element, type, length, decimals, and description.

### `DDIF_TABL_GET` → `DD03P_TAB`
Returns the raw field list including `.INCLUDE` marker rows. These rows have `COMPTYPE = 'S'` and carry the include structure name in `PRECFIELD` (not in `ROLLNAME`, which is empty). Used exclusively to build the field→include map.

> `DD03L` is not used directly because `.INCLUDE` rows in DD03L have empty `ROLLNAME` and no reliable pointer to the include structure name.

## Field→Include Map

A `HASHED TABLE` with `UNIQUE KEY fieldname` is built by iterating `DD03P_TAB` in position order. When a `.INCLUDE` marker row is encountered (`FIELDNAME CP '.*'`), the current include name is updated from `PRECFIELD`. All subsequent regular fields are mapped to that include until the next marker.

## Text Element Handling

Text symbols are `C`-type fields of fixed length defined in SE32. When used inside string templates (`| ... |`), they carry trailing spaces. The pattern used to avoid truncation:

```abap
DATA(lv_hxx) = CONV string( TEXT-hxx ).
CONDENSE lv_hxx.
```

`COND` result type must be declared explicitly as `string` — otherwise the C(6) literal `'NONAME'` infers `C(6)` for the entire expression, silently truncating every column label.

## Output

`GUI_DOWNLOAD` is called with:
- `FILETYPE = 'ASC'` — plain text
- `CODEPAGE = '4110'` — UTF-8
- `WRITE_BOM = 'X'` — prepends UTF-8 BOM for Excel compatibility
