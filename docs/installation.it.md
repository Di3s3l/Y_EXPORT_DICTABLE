# Installazione

## Requisiti

- Sistema SAP con release ABAP **7.40 o superiore**
- Accesso a **SE38** (Editor ABAP)
- Accesso a **SE32** (Text Elements ABAP)
- Workstation frontend con SAP GUI (richiesto da `GUI_DOWNLOAD`)

## Procedura

1. Aprire **SE38** nel sistema SAP
2. Creare il programma `Y_EXPORT_DICTABLE`
   - Pacchetto: **$TMP** (locale, non trasportabile — nessun coinvolgimento Basis, nessuna richiesta di trasporto)
3. Caricare il sorgente: **Utilities → Upload/Download → Upload** → selezionare `src/Y_EXPORT_DICTABLE.abap`
4. Attivare: **Ctrl+F3**
5. Mantenere i text element: **SE38 → Goto → Text Elements** — vedere [Guida Text Elements](text-elements-guide.it.md)

> I text element **non** sono incorporati nel file `.abap`. Devono essere ricreati manualmente in ogni sistema di destinazione dopo l'upload.

## Strategia Pacchetto

L'assegnazione a `$TMP` rende l'oggetto locale al sistema, mai incluso nelle richieste di trasporto. La distribuzione tra sistemi avviene caricando il sorgente via SE38 — nessun coinvolgimento di Basis o CTS.
