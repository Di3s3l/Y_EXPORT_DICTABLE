# Formato Output CSV

## Struttura

- Separatore: **punto e virgola** (`;`)
- Encoding: **UTF-8 con BOM**
- Prima riga: intestazioni colonne (configurabili via text element H01–H07)
- Una riga per campo, escluse le righe marcatore `.INCLUDE`

## Colonne

| # | Intestazione default | Campo sorgente | Note |
|---|---------------------|----------------|------|
| 1 | `FIELD_NAME` | `DFIES-FIELDNAME` | Nome tecnico del campo |
| 2 | `DATA_ELEMENT` | `DFIES-ROLLNAME` | Data element associato |
| 3 | `DDIC_TYPE` | `DFIES-DATATYPE` | Tipo base DDIC (CHAR, NUMC, DATS…) |
| 4 | `LENGTH` | `DFIES-LENG` | Lunghezza campo (numerico, senza zeri iniziali) |
| 5 | `DECIMALS` | `DFIES-DECIMALS` | Cifre decimali (numerico, senza zeri iniziali) |
| 6 | `DESCRIPTION` | `DFIES-FIELDTEXT` | Etichetta campo nella lingua di logon |
| 7 | `INCLUDE` | `DD03P-PRECFIELD` | Nome struttura include sorgente |

## Note

- I punti e virgola nelle descrizioni dei campi vengono sostituiti automaticamente con virgole per preservare la struttura CSV
- La colonna `INCLUDE` è vuota per i campi definiti direttamente sulla tabella (non tramite include)
- Le intestazioni sono configurabili singolarmente via text element H01–H07; i simboli non mantenuti mostrano `NONAME`
