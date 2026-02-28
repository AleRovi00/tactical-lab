# 📋 PROGETTO.md — File di contesto TacticalLab

> Questo file serve per riprendere lo sviluppo in future sessioni con GitHub Copilot.
> All'inizio di ogni nuova chat scrivi:
> "Sto sviluppando TacticalLab. Leggi il file PROGETTO.md su https://github.com/AleRovi00/tactical-lab/blob/main/PROGETTO.md e continua ad aiutarmi da dove eravamo rimasti."

---

## Descrizione del progetto

TacticalLab è un tool tattico per allenatori di calcio (a 11 e a 5) che permette di:
- Visualizzare moduli tattici su un campo (pallini posizionati)
- Confrontare due schemi affiancati
- Salvare formazioni personalizzate
- Analizzare varianti di allenatori famosi (Guardiola, Conte, Klopp, Ancelotti)
- Visualizzare heatmap e statistiche aggregate

**NON** è un gestionale di squadre reali - è un tool tattico con "pallini" sul campo.

---

## Stack tecnologico

- **Frontend:** HTML/CSS/JavaScript vanilla (no framework)
- **Backend:** Node.js + Express
- **Database:** MySQL (MySQL Workbench)
- **Deploy:** Vercel (frontend) + Render (backend)
- **Versionamento:** Git/GitHub

---

## Schema database — Piano a 3 fasi

### Fase 1 - Base
- `sport` (id, nome, num_giocatori, larghezza_campo, lunghezza_campo)
- `moduli` (id, sport_id FK, nome, descrizione, tipo_gioco ENUM, anni_popolarita, difficolta ENUM)
- `posizioni` (id, modulo_id FK, ruolo, pos_x, pos_y)

### Fase 2 - Intermedia
- `allenatori` (id, nome, cognome, nazione, anno_nascita, filosofia_tattica, squadre_principali, periodo_apice)
- `varianti_modulo` (id, modulo_base_id FK, allenatore_id FK, nome_variante, squadra, stagione, descrizione_tattica, caratteristiche_chiave)
- Estendere `posizioni` con: pos_x_difesa, pos_y_difesa, pos_x_possesso, pos_y_possesso, pos_x_attacco, pos_y_attacco, movimento_principale, ruolo_specifico

### Fase 3 - Avanzata
- `heatmaps` (id, variante_id FK, partita, data_partita, zona_campo, intensita, coordinate_json JSON, fonte)
- `statistiche_modulo` (id, variante_id FK, partite_analizzate, possesso_medio, passaggi_medi, tiri_medi, gol_segnati_medi, gol_subiti_medi, fonte_dati)
- `confronti` (id, variante_1_id FK, variante_2_id FK, punti_forza_1, punti_deboli_1, punti_forza_2, punti_deboli_2, chi_vince_centrocampo, chi_vince_fasce, note_tattiche)

---

## Timeline

| Periodo | Obiettivo |
|---------|-----------|
| Febbraio 2026 | Fase 1 — Database base |
| Marzo 2026 | Backend Node.js + Frontend HTML/CSS base |
| Aprile 2026 | Funzionalità avanzate + Deploy |
| Maggio 2026 | Presentazione esame finale |

---

## Metodo di apprendimento

Approccio **"Build to Learn"**:
1. Capire ogni riga di codice
2. Commentare tutto
3. Rompere il codice per capire gli errori
4. Riscrivere da zero dopo aver capito

---

## ✅ Stato avanzamento

- [x] Repository creato
- [ ] Schema SQL Fase 1 — **PROSSIMO STEP**
- [ ] Popolare DB con moduli reali
- [ ] Server Node.js base
- [ ] Pagina HTML campo da calcio
- [ ] Collegare frontend e backend
- [ ] Deploy
