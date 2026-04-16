# Utilizzo

🇬🇧 [English version](../usage.md)

## Esecuzione del Report

1. Eseguire il report da SE38 o da transazione (**F8**)
2. Inserire il **nome tabella** (es. `MARA`, `KNA1`, `VBAK`)
3. Inserire il **percorso file di output** — il valore predefinito è impostato dai text element `D01` + `D02`
   - Usare il tasto **F4** per sfogliare il filesystem locale
4. Premere **Esegui (F8)** — il CSV viene scaricato sulla workstation frontend

## Messaggi

Tutti i messaggi appaiono come finestre di dialogo popup.

| Messaggio | Tipo | Trigger |
|-----------|------|---------|
| M01 | Errore | Tabella non trovata o non attiva nel DDIC |
| M02 | Errore | Metadati campo non leggibili |
| M03 | Avviso | Mappa include non leggibile (l'export continua) |
| M04 | Info | Export completato con successo |
| M05 | Errore | Download file fallito |

## Note

- Il report richiede una connessione SAP GUI attiva (usa `GUI_DOWNLOAD` — non compatibile con job in background)
- L'encoding di output è sempre UTF-8 con BOM, indipendentemente dalla lingua di logon
- Le descrizioni dei campi vengono risolte nella **lingua di logon**
