-- ============================================================
-- TacticalLab - Schema Database Fase 1
-- ============================================================
-- Questo file crea il database e le tabelle base del progetto.
-- Eseguilo in MySQL Workbench connettendoti al tuo server locale.
-- ============================================================


-- Creiamo il database se non esiste ancora
-- "IF NOT EXISTS" evita errori se lo esegui più volte
CREATE DATABASE IF NOT EXISTS tacticallab;

-- Diciamo a MySQL di usare questo database da ora in poi
USE tacticallab;


-- ============================================================
-- TABELLA: sport
-- Contiene i tipi di sport supportati (calcio a 11 e calcio a 5)
-- È la tabella "padre" da cui dipendono i moduli
-- ============================================================
CREATE TABLE sport (
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Identificatore unico, si incrementa da solo
    nome VARCHAR(50) NOT NULL,           -- Es: 'Calcio a 11', 'Calcio a 5'
    num_giocatori INT NOT NULL,          -- Quanti giocatori per squadra (11 o 5)
    larghezza_campo DECIMAL(5,2),        -- Larghezza del campo in metri
    lunghezza_campo DECIMAL(5,2)         -- Lunghezza del campo in metri
);

-- Inseriamo i dati: calcio a 11 e calcio a 5
-- Le misure sono quelle ufficiali FIFA/FIGC
INSERT INTO sport (nome, num_giocatori, larghezza_campo, lunghezza_campo) VALUES
('Calcio a 11', 11, 68.00, 105.00),
('Calcio a 5',   5, 25.00,  42.00);


-- ============================================================
-- TABELLA: moduli
-- Contiene i moduli tattici (es. 4-3-3, 4-4-2, 2-2...)
-- Ogni modulo appartiene a uno sport (FK sport_id)
-- ============================================================
CREATE TABLE moduli (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sport_id INT NOT NULL,               -- A quale sport appartiene questo modulo?
    nome VARCHAR(20) NOT NULL,           -- Es: '4-3-3', '3-5-2', '2-2'

    -- Descrizione testuale del modulo
    descrizione TEXT,

    -- ENUM: il valore può essere solo uno di questi tre
    -- Utile per filtrare i moduli per stile di gioco
    tipo_gioco ENUM('offensivo', 'difensivo', 'equilibrato'),

    anni_popolarita VARCHAR(50),         -- Es: 'Anni 2000-2010', 'Moderno'

    -- ENUM: difficoltà di esecuzione del modulo
    difficolta ENUM('base', 'intermedio', 'avanzato'),

    -- Chiave esterna: lega questo modulo a uno sport
    -- ON DELETE CASCADE = se elimini lo sport, si eliminano anche i suoi moduli
    FOREIGN KEY (sport_id) REFERENCES sport(id) ON DELETE CASCADE
);

-- Moduli per Calcio a 11 (sport_id = 1)
INSERT INTO moduli (sport_id, nome, descrizione, tipo_gioco, anni_popolarita, difficolta) VALUES
(1, '4-3-3',  'Tre attaccanti, centrocampo a tre. Modulo offensivo molto usato nel calcio moderno.',          'offensivo',   'Anni 2000-oggi',  'intermedio'),
(1, '4-4-2',  'Quattro difensori, quattro centrocampisti, due attaccanti. Il modulo più classico.',            'equilibrato', 'Anni 1980-2000',  'base'),
(1, '3-5-2',  'Difesa a tre con cinque centrocampisti. Domina il centrocampo con esterni totali.',             'equilibrato', 'Anni 1990-oggi',  'avanzato'),
(1, '4-2-3-1','Un solo attaccante supportato da trequartisti. Molto usato in Europa.',                         'equilibrato', 'Anni 2000-oggi',  'intermedio'),
(1, '5-3-2',  'Cinque difensori per una linea difensiva molto solida. Variante difensiva del 3-5-2.',          'difensivo',   'Anni 1990-oggi',  'intermedio'),
(1, '4-3-3',  'Versione difensiva: centrocampo abbassato, ali che aiutano i terzini.',                        'difensivo',   'Moderno',         'avanzato');

-- Moduli per Calcio a 5 (sport_id = 2)
INSERT INTO moduli (sport_id, nome, descrizione, tipo_gioco, anni_popolarita, difficolta) VALUES
(2, '2-2',    'Due difensori e due attaccanti. Il modulo base e più equilibrato del calcio a 5.',              'equilibrato', 'Classico',        'base'),
(2, '1-2-1',  'Rombo: un difensore, due centrocampisti, un attaccante. Molto dinamico.',                      'offensivo',   'Moderno',         'intermedio'),
(2, '1-3',    'Un solo difensore e tre attaccanti. Ultra-offensivo, si usa quando si è sotto nel punteggio.', 'offensivo',   'Situazionale',    'avanzato'),
(2, '3-1',    'Tre difensori e un attaccante. Ultra-difensivo, si usa per proteggere il vantaggio.',          'difensivo',   'Situazionale',    'intermedio');


-- ============================================================
-- TABELLA: posizioni
-- Contiene le coordinate (x, y) di ogni "pallino" sul campo
-- per ogni modulo. Il campo è normalizzato da 0 a 100.
--
-- Asse X: 0 = porta propria, 100 = porta avversaria
-- Asse Y: 0 = fascia sinistra, 100 = fascia destra
--         50 = centro del campo
-- ============================================================
CREATE TABLE posizioni (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modulo_id INT NOT NULL,              -- A quale modulo appartiene questa posizione?
    ruolo VARCHAR(50) NOT NULL,          -- Es: 'Portiere', 'Terzino SX', 'Punta'
    pos_x DECIMAL(5,2) NOT NULL,         -- Posizione sull'asse X (profondità in campo)
    pos_y DECIMAL(5,2) NOT NULL,         -- Posizione sull'asse Y (larghezza in campo)

    FOREIGN KEY (modulo_id) REFERENCES moduli(id) ON DELETE CASCADE
);

-- ============================================================
-- Posizioni per il 4-3-3 (modulo_id = 1)
-- Lettura: pos_x=10 vuol dire molto vicino alla propria porta
--          pos_y=50 vuol dire esattamente al centro in larghezza
-- ============================================================
INSERT INTO posizioni (modulo_id, ruolo, pos_x, pos_y) VALUES
(1, 'Portiere',              10, 50),
(1, 'Terzino SX',            28, 15),
(1, 'Difensore Centrale SX', 25, 38),
(1, 'Difensore Centrale DX', 25, 62),
(1, 'Terzino DX',            28, 85),
(1, 'Mediano',               45, 50),
(1, 'Mezzala SX',            50, 30),
(1, 'Mezzala DX',            50, 70),
(1, 'Ala SX',                75, 18),
(1, 'Punta Centrale',        78, 50),
(1, 'Ala DX',                75, 82);

-- Posizioni per il 4-4-2 (modulo_id = 2)
INSERT INTO posizioni (modulo_id, ruolo, pos_x, pos_y) VALUES
(2, 'Portiere',              10, 50),
(2, 'Terzino SX',            28, 15),
(2, 'Difensore Centrale SX', 25, 38),
(2, 'Difensore Centrale DX', 25, 62),
(2, 'Terzino DX',            28, 85),
(2, 'Centrocampista SX',     48, 20),
(2, 'Centrocampista Centro SX', 48, 40),
(2, 'Centrocampista Centro DX', 48, 60),
(2, 'Centrocampista DX',     48, 80),
(2, 'Attaccante SX',         75, 35),
(2, 'Attaccante DX',         75, 65);

-- Posizioni per il 3-5-2 (modulo_id = 3)
INSERT INTO posizioni (modulo_id, ruolo, pos_x, pos_y) VALUES
(3, 'Portiere',              10, 50),
(3, 'Difensore Centrale SX', 25, 30),
(3, 'Difensore Centrale',    25, 50),
(3, 'Difensore Centrale DX', 25, 70),
(3, 'Esterno SX',            50, 10),
(3, 'Mediano SX',            48, 33),
(3, 'Mediano Centrale',      48, 50),
(3, 'Mediano DX',            48, 67),
(3, 'Esterno DX',            50, 90),
(3, 'Prima Punta',           78, 40),
(3, 'Seconda Punta',         78, 60);

-- Posizioni per il 2-2 calcio a 5 (modulo_id = 7)
INSERT INTO posizioni (modulo_id, ruolo, pos_x, pos_y) VALUES
(7, 'Portiere',   10, 50),
(7, 'Difensore SX', 30, 30),
(7, 'Difensore DX', 30, 70),
(7, 'Attaccante SX', 65, 30),
(7, 'Attaccante DX', 65, 70);

-- Posizioni per il 1-2-1 calcio a 5 (modulo_id = 8)
INSERT INTO posizioni (modulo_id, ruolo, pos_x, pos_y) VALUES
(8, 'Portiere',      10, 50),
(8, 'Difensore',     28, 50),
(8, 'Mezzala SX',    50, 25),
(8, 'Mezzala DX',    50, 75),
(8, 'Attaccante',    72, 50);


-- ============================================================
-- QUERY DI VERIFICA
-- Esegui queste query per controllare che tutto sia stato
-- inserito correttamente
-- ============================================================

-- Mostra tutti gli sport
-- SELECT * FROM sport;

-- Mostra tutti i moduli con il nome dello sport
-- SELECT m.nome AS modulo, s.nome AS sport, m.tipo_gioco, m.difficolta
-- FROM moduli m
-- JOIN sport s ON m.sport_id = s.id
-- ORDER BY s.id, m.nome;

-- Mostra le posizioni del 4-3-3
-- SELECT p.ruolo, p.pos_x, p.pos_y
-- FROM posizioni p
-- JOIN moduli m ON p.modulo_id = m.id
-- WHERE m.nome = '4-3-3' AND m.sport_id = 1;
