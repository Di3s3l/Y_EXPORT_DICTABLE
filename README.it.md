# Y_EXPORT_DICTABLE

<img src="assets/sap-s4hana-logo.png" alt="SAP S/4HANA" width="200"/>

![Versione](https://img.shields.io/badge/versione-1.0-blue) ![ABAP](https://img.shields.io/badge/ABAP-7.40%2B-brightgreen)

🇬🇧 [English version](README.md)

Report SAP ABAP che esporta la struttura dei campi di qualsiasi tabella DDIC trasparente in un file CSV UTF-8 delimitato da punto e virgola sulla workstation frontend.

---

## Funzionalità

- Esporta tutti i campi di una tabella trasparente con metadati DDIC completi
- Risolve la struttura include sorgente per ogni campo
- Output UTF-8 con BOM (compatibile Excel)
- Etichette UI e messaggi configurabili via SE32 — nessuna modifica al sorgente richiesta
- Le intestazioni colonne mostrano `NONAME` se i text element non sono mantenuti

---

## Documentazione

La cartella [`docs/it/`](docs/it/README.md) contiene istruzioni di installazione, guida all'utilizzo, riferimento output CSV, guida text elements e note tecniche.

---

## File

| File | Descrizione |
|------|-------------|
| `src/Y_EXPORT_DICTABLE.abap` | Sorgente ABAP |
| `src/text-element.md` | Text elements — copiare i valori in SE32 |
| `docs/` | Documentazione completa |

---

## Licenza e Copyright

Copyright © 2026 <a href="https://enz.ovh" target="_blank">Di3s3l</a>

Uso personale e uso aziendale interno consentiti. La ridistribuzione o pubblicazione di versioni modificate richiede l'attribuzione all'autore originale.
