# 📋 PROGETTO.md — Contesto di Sviluppo TacticalLab

> **Come usare questo file:**
> Quando inizi una nuova sessione di chat con GitHub Copilot, scrivi:
> _"Sto sviluppando TacticalLab. Leggi il file PROGETTO.md su https://github.com/AleRovi00/tactical-lab/blob/main/PROGETTO.md e continua ad aiutarmi da dove eravamo rimasti."_

---

## 🎯 Descrizione del Progetto

**TacticalLab** è un tool tattico per allenatori di calcio (a 11 e a 5) che permette di:

- Visualizzare moduli tattici su un campo (pallini posizionati)
- Confrontare due schemi tattici affiancati
- Salvare formazioni personalizzate
- Analizzare varianti di allenatori famosi (Guardiola, Conte, Klopp, Ancelotti)
- Visualizzare heatmap e statistiche aggregate

> ⚠️ NON è un gestionale di squadre reali — è un tool tattico con "pallini" sul campo.

---

## 🛠️ Stack Tecnologico

- **Frontend:** HTML / CSS / JavaScript vanilla (nessun framework)
- **Backend:** Node.js + Express
- **Database:** MySQL (MySQL Workbench)
- **Deploy:** Vercel (frontend) + Render (backend)
- **Versionamento:** Git / GitHub

---

## 🗄️ Schema Database (Piano a 3 Fasi)

### Fase 1 — Base

```sql
-- Tipi di sport supportati
sport (id, nome, num_giocatori, larghezza_campo, lunghezza_campo)

-- Moduli tattici (es. 4-3-3, 3-5-2...)
moduli (id, sport_id FK, nome, descrizione, tipo_gioco ENUM, anni_popolarita, difficolta ENUM)

-- Posizioni dei giocatori sul campo
posizioni (id, modulo_id FK, ruolo, pos_x, pos_y)
```

### Fase 2 — Intermedia

```sql
-- Allenatori famosi
allenatori (id, nome, cognome, nazione, anno_nascita, filosofia_tattica, squadre_principali, periodo_apice)

-- Varianti dei moduli usate da specifici allenatori
varianti_modulo (id, modulo_base_id FK, allenatore_id FK, nome_variante, squadra, stagione, descrizione_tattica, caratteristiche_chiave)

-- Estensione di posizioni con fasi di gioco
posizioni + (pos_x_difesa, pos_y_difesa, pos_x_possesso, pos_y_possesso, pos_x_attacco, pos_y_attacco, movimento_principale, ruolo_specifico)
```

### Fase 3 — Avanzata

```sql
-- Dati heatmap per varianti
heatmaps (id, variante_id FK, partita, data_partita, zona_campo, intensita, coordinate_json JSON, fonte)

-- Statistiche aggregate per modulo/variante
statistiche_modulo (id, variante_id FK, partite_analizzate, possesso_medio, passaggi_medi, tiri_medi, gol_segnati_medi, gol_subiti_medi, fonte_dati)

-- Confronti tattici tra due varianti
confronti (id, variante_1_id FK, variante_2_id FK, punti_forza_1, punti_deboli_1, punti_forza_2, punti_deboli_2, chi_vince_centrocampo, chi_vince_fasce, note_tattiche)
```

---

## 📅 Timeline

| Periodo         | Fase | Obiettivo                                      |
|-----------------|------|------------------------------------------------|
| Febbraio 2026   | 1    | Database base: schema SQL + popolamento dati   |
| Marzo 2026      | 2    | Backend Node.js + Express + Frontend HTML/CSS  |
| Aprile 2026     | 3    | Funzionalità avanzate + Deploy                 |
| Maggio 2026     | —    | Presentazione esame finale                     |

---

## 📚 Metodo di Apprendimento

Approccio **"Build to Learn"**:
- Capire ogni riga di codice prima di procedere
- Commentare tutto in modo didattico
- Rompere il codice appositamente per capire gli errori
- Riscrivere da zero dopo aver compreso il concetto

---

## ✅ Stato Attuale

- [x] Repository creato
- [x] README.md aggiornato
- [x] PROGETTO.md creato
- [x] Struttura cartelle (database/, backend/, frontend/)
- [ ] Schema SQL Fase 1 (`database/schema.sql`)
- [ ] Popolare DB con moduli reali
- [ ] Server Node.js base (`backend/server.js`)
- [ ] Pagina HTML campo da calcio (`frontend/index.html`)
- [ ] Collegare frontend e backend
- [ ] Deploy su Vercel + Render

---

## 📁 Struttura Corrente del Progetto

```
tactical-lab/
├── README.md          ← presentazione pubblica del progetto
├── PROGETTO.md        ← questo file (memoria per Copilot)
├── database/
│   └── README.md      ← istruzioni script SQL
├── backend/
│   └── README.md      ← istruzioni server Node.js
└── frontend/
    └── README.md      ← istruzioni interfaccia HTML/CSS/JS
```

---

## 🔗 Link Utili

- Repository: https://github.com/AleRovi00/tactical-lab
- Issue tracker: https://github.com/AleRovi00/tactical-lab/issues
