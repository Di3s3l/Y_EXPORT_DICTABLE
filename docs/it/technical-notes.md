# Note Tecniche

← [Documentazione](README.md) | 🇬🇧 [English version](../technical-notes.md)

## Requisiti

| Requisito | Dettaglio |
|-----------|-----------|
| Release ABAP minima | 7.40 (dichiarazioni inline, string template, `COND`) |
| SAP GUI | Obbligatorio — `GUI_DOWNLOAD` è una funzione frontend |
| Autorizzazioni | Accesso in lettura a DD02L, DD03P (tabelle metadati DDIC) |
| Pacchetto | `$TMP` consigliato — locale, non trasportabile |

## API DDIC

### `DDIF_FIELDINFO_GET`
Restituisce una tabella `DFIES` piatta con tutti i campi della tabella risolti ai tipi base. Le righe marcatore `.INCLUDE` **non** sono presenti — la tabella è già appiattita. Utilizzata per nome campo, data element, tipo, lunghezza, decimali e descrizione.

### `DDIF_TABL_GET` → `DD03P_TAB`
Restituisce la lista grezza dei campi incluse le righe marcatore `.INCLUDE`. Queste righe hanno `COMPTYPE = 'S'` e portano il nome della struttura include in `PRECFIELD` (non in `ROLLNAME`, che è vuoto). Usata esclusivamente per costruire la mappa campo→include.

> `DD03L` non viene usata direttamente perché le righe `.INCLUDE` in DD03L hanno `ROLLNAME` vuoto e nessun puntatore affidabile al nome della struttura include.

## Mappa Campo→Include

Una `HASHED TABLE` con `UNIQUE KEY fieldname` viene costruita iterando `DD03P_TAB` in ordine posizionale. Quando si incontra una riga marcatore `.INCLUDE` (`FIELDNAME CP '.*'`), il nome include corrente viene aggiornato da `PRECFIELD`. Tutti i campi regolari successivi vengono mappati a quell'include fino al marcatore successivo.

## Gestione Text Element

I simboli text sono campi di tipo `C` a lunghezza fissa definiti in SE32. Usati dentro string template (`| ... |`), portano spazi finali. Pattern usato per evitare troncamenti:

```abap
DATA(lv_hxx) = CONV string( TEXT-hxx ).
CONDENSE lv_hxx.
```

Il tipo risultato di `COND` deve essere dichiarato esplicitamente come `string` — altrimenti il letterale `'NONAME'` di tipo C(6) inferisce C(6) per tutta l'espressione, troncando silenziosamente ogni intestazione colonna.

## Output

`GUI_DOWNLOAD` viene chiamata con:
- `FILETYPE = 'ASC'` — testo semplice
- `CODEPAGE = '4110'` — UTF-8
- `WRITE_BOM = 'X'` — aggiunge BOM UTF-8 per compatibilità Excel
