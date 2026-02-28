# 🗄️ Database — Script SQL

Questa cartella contiene tutti gli script SQL del progetto TacticalLab.

## Contenuto previsto

| File          | Descrizione                                      |
|---------------|--------------------------------------------------|
| `schema.sql`  | Schema del database (tabelle, relazioni, indici) |
| `seed.sql`    | Dati di esempio (moduli, sport, posizioni)       |

## Come usare gli script

```bash
# Crea il database e importa lo schema
mysql -u root -p < schema.sql

# Popola il database con i dati di esempio
mysql -u root -p tactical_lab < seed.sql
```

## Struttura del database (Fase 1)

- **sport** — tipi di sport supportati (calcio a 11, calcio a 5)
- **moduli** — moduli tattici (es. 4-3-3, 3-5-2, ...)
- **posizioni** — posizioni dei giocatori sul campo per ogni modulo

> Gli script verranno aggiunti durante la Fase 1 dello sviluppo (Febbraio 2026).
