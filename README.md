# ⚽ TacticalLab

> Tool web per l'analisi tattica del calcio (a 11 e a 5) — progetto finale del corso Full Stack Developer.

---

## 📌 Descrizione

**TacticalLab** è un'applicazione web pensata per allenatori e appassionati di calcio che vogliono:

- 📐 Visualizzare moduli tattici su un campo interattivo (pallini posizionati)
- 🔀 Confrontare due schemi tattici affiancati
- 💾 Salvare formazioni personalizzate
- 🧠 Analizzare le varianti di allenatori famosi (Guardiola, Conte, Klopp, Ancelotti)
- 🌡️ Visualizzare heatmap e statistiche aggregate

> **Nota:** TacticalLab NON è un gestionale di squadre reali. È un tool tattico con "pallini" sul campo.

---

## 🛠️ Stack Tecnologico

| Layer      | Tecnologia                          |
|------------|-------------------------------------|
| Frontend   | HTML / CSS / JavaScript (vanilla)   |
| Backend    | Node.js + Express                   |
| Database   | MySQL (MySQL Workbench)             |
| Deploy     | Vercel (frontend) + Render (backend)|
| Versioning | Git / GitHub                        |

---

## 📁 Struttura delle Cartelle

```
tactical-lab/
├── README.md          ← questo file
├── PROGETTO.md        ← contesto di sviluppo per sessioni Copilot
├── database/
│   ├── README.md      ← istruzioni per gli script SQL
│   └── schema.sql     ← (verrà aggiunto nella Fase 1)
├── backend/
│   ├── README.md      ← istruzioni per il server Node.js
│   └── server.js      ← (verrà aggiunto nella Fase 2)
└── frontend/
    ├── README.md      ← istruzioni per l'interfaccia HTML/CSS/JS
    └── index.html     ← (verrà aggiunto nella Fase 3)
```

---

## 🚀 Come Avviare il Progetto in Locale

> Le istruzioni dettagliate verranno completate man mano che il progetto avanza.

```bash
# 1. Clona il repository
git clone https://github.com/AleRovi00/tactical-lab.git
cd tactical-lab

# 2. Installa le dipendenze del backend (Fase 2)
cd backend
npm install

# 3. Avvia il server (Fase 2)
npm start

# 4. Apri il frontend nel browser (Fase 3)
# Apri frontend/index.html nel browser
```

---

## 🗺️ Roadmap

| Fase | Contenuto                                      | Stato        |
|------|------------------------------------------------|--------------|
| 1    | 🗄️ Database MySQL — schema SQL base + popolamento | 🔄 In corso |
| 2    | ⚙️ Backend Node.js + Express — API REST         | ⏳ Pianificata |
| 3    | 🎨 Frontend HTML/CSS/JS — campo interattivo     | ⏳ Pianificata |
| 4    | 🚀 Deploy su Vercel + Render                    | ⏳ Pianificata |

---

## 📅 Timeline

- **Febbraio 2026** — Fase 1: Database base
- **Marzo 2026** — Fase 2: Backend + Frontend base
- **Aprile 2026** — Funzionalità avanzate + Deploy
- **Maggio 2026** — Presentazione esame finale

---

## 👤 Autore

Progetto realizzato come **esame finale** del corso *Full Stack Developer: Sviluppatore Software e Cloud Specialist*.

---

## 📄 Licenza

Questo progetto è a scopo didattico.
