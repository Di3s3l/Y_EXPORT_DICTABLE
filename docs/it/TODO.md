# TODO

🇬🇧 [English version](../TODO.md)

## Alta priorità

### 1 — Anteprima ALV
Mostrare la struttura della tabella in una griglia ALV prima di scaricare il CSV.
L'utente può revisionare l'output, deselezionare righe o annullare senza scrivere su disco.

- Aggiungere un parametro checkbox `P_PREV` nella selection screen ("Anteprima prima dell'export")
- Se selezionato, visualizzare `lt_csv_data` (o una internal table strutturata) tramite `CL_SALV_TABLE`
- Export solo dopo conferma dell'utente dalla toolbar ALV

---

### 2 — Filtro Campi
Permettere all'utente di escludere campi per pattern di nome o tipo DDIC dalla selection screen.

- Aggiungere parametro opzionale `P_EXCL` (es. `MANDT,*_DATE`) — lista separata da virgola di pattern di nomi campo
- Aggiungere parametro opzionale `P_TYPE` — esclusione per tipo DDIC (es. `CLNT`)
- Filtro applicato prima della costruzione delle righe CSV

---

## Media priorità

### 3 — Export Multi-tabella
Accettare una lista di tabelle invece di una sola ed esportarle tutte in un'unica esecuzione.

- Sostituire `p_tab` con un SELECT-OPTIONS range `s_tab`
- Opzione A: un CSV per tabella (file nominato secondo la tabella)
- Opzione B: singolo CSV con colonna aggiuntiva `TABLE_NAME` come prima colonna
- Aggiungere parametro per scegliere tra A e B

---

### 4 — Separatore Configurabile
Sostituire il punto e virgola hardcoded con un text element o parametro.

- Aggiungere parametro `P_SEP` con default da text element `D03`
- Applicare `P_SEP` nella costruzione della riga CSV e nell'assemblaggio dell'header
- Aggiornare la gestione separatore in `GUI_DOWNLOAD` se necessario
- Documentare il nuovo text element `D03` in `src/text-element.md`

---

## Note

- Gli elementi sono indipendenti — ciascuno può essere implementato senza gli altri
- Anteprima ALV (1) e filtro campi (2) non hanno dipendenze con multi-tabella (3) o separatore (4)
- Multi-tabella (3) richiede di rivedere la logica del nome file predefinito nel percorso `INITIALIZATION`
