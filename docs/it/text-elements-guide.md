# Y_EXPORT_DICTABLE — Guida Text Elements

🇬🇧 [English version](../text-elements-guide.md)

Mantenere in **SE38 → Goto → Text Elements** (o **SE32**).  
Dopo aver caricato il sorgente in un nuovo sistema, ricreare tutte le voci seguenti prima di eseguire il report.

I valori di riferimento sono in [`src/text-element.md`](../../src/text-element.md).

---

## Simboli Text
*SE38 → Goto → Text Elements → Text Symbols*

### Selection screen

| Simbolo | Lung. max | Valore |
|---------|-----------|--------|
| `001`   | 30        | `Export DDIC Table Structure` |
| `S01`   | 100       | `Exports the DDIC structure of a table to a semicolon-separated CSV file.` |
| `S02`   | 100       | `Separator: semicolon (;)   Encoding: UTF-8 with BOM` |
| `D01`   | 20        | `C:\TMP` |
| `D02`   | 20        | `export.csv` |

### Intestazioni colonne CSV (un simbolo per colonna)

Se un simbolo è vuoto o non mantenuto, l'intestazione di quella colonna viene sostituita automaticamente da `NONAME`.

| Simbolo | Lung. max | Valore |
|---------|-----------|--------|
| `H01`   | 30        | `FIELD_NAME` |
| `H02`   | 30        | `DATA_ELEMENT` |
| `H03`   | 30        | `DDIC_TYPE` |
| `H04`   | 30        | `LENGTH` |
| `H05`   | 30        | `DECIMALS` |
| `H06`   | 30        | `DESCRIPTION` |
| `H07`   | 30        | `INCLUDE` |

### Messaggi

| Simbolo | Lung. max | Valore |
|---------|-----------|--------|
| `M01`   | 100       | `Table not found or not active.` |
| `M02`   | 100       | `Cannot read table field structure.` |
| `M03`   | 100       | `Cannot read include structure map.` |
| `M04`   | 100       | `Export completed successfully.` |
| `M05`   | 100       | `File download failed.` |
| `M06`   | 100       | `Insufficient authorization to read DDIC object.` |

---

## Selection Texts
*SE38 → Goto → Text Elements → Selection Texts*

| Parametro | Testo |
|-----------|-------|
| `P_TAB`   | `Table Name` |
| `P_FILE`  | `Output File` |

---

## Riferimento al Codice

| Simbolo | Posizione nel codice | Scopo |
|---------|---------------------|-------|
| `TEXT-001` | `SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001` | Titolo blocco selection screen |
| `TEXT-S01` | `SELECTION-SCREEN COMMENT 1(70) TEXT-s01` | Info-box riga 1 |
| `TEXT-S02` | `SELECTION-SCREEN COMMENT 1(70) TEXT-s02` | Info-box riga 2 |
| `TEXT-D01` | `INITIALIZATION: p_file = TEXT-d01 && TEXT-d02` | Percorso output predefinito |
| `TEXT-D02` | `INITIALIZATION: p_file = TEXT-d01 && TEXT-d02` | Nome file output predefinito |
| `TEXT-H01`–`H07` | Assemblaggio header CSV | Un'etichetta per colonna |
| `TEXT-M06` | `AUTHORITY-CHECK ... MESSAGE TEXT-m06 TYPE 'I'` | Autorizzazione DDIC mancante |
| `TEXT-M01` | `MESSAGE TEXT-m01 TYPE 'I'` | Tabella non trovata |
| `TEXT-M02` | `MESSAGE TEXT-m02 TYPE 'I'` | Errore lettura metadati campo |
| `TEXT-M03` | `MESSAGE TEXT-m03 TYPE 'I'` | Errore lettura mappa include |
| `TEXT-M04` | `MESSAGE TEXT-m04 TYPE 'I'` | Export completato |
| `TEXT-M05` | `MESSAGE TEXT-m05 TYPE 'I'` | Download fallito |
