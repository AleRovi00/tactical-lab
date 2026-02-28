# ⚙️ Backend — Server Node.js + Express

Questa cartella contiene il server backend del progetto TacticalLab.

## Contenuto previsto

| File / Cartella   | Descrizione                                      |
|-------------------|--------------------------------------------------|
| `server.js`       | Entry point del server Express                   |
| `routes/`         | Definizione delle route API REST                 |
| `controllers/`    | Logica di business per ogni route                |
| `db.js`           | Connessione al database MySQL                    |
| `package.json`    | Dipendenze Node.js                               |

## Come avviare il server

```bash
# Entra nella cartella backend
cd backend

# Installa le dipendenze
npm install

# Avvia il server in sviluppo
npm run dev

# Avvia il server in produzione
npm start
```

## API previste

- `GET /api/moduli` — restituisce tutti i moduli tattici
- `GET /api/moduli/:id` — restituisce un modulo specifico con le posizioni
- `GET /api/sport` — restituisce i tipi di sport supportati
- `POST /api/moduli` — crea un nuovo modulo personalizzato

> Il codice verrà aggiunto durante la Fase 2 dello sviluppo (Marzo 2026).
