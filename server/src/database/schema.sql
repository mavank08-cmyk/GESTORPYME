PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS business (
  id INTEGER PRIMARY KEY CHECK (id = 1), name TEXT NOT NULL,
  identification TEXT, address TEXT, phone TEXT, email TEXT,
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE TABLE IF NOT EXISTS suppliers (
  id INTEGER PRIMARY KEY, name TEXT NOT NULL, identification TEXT UNIQUE,
  phone TEXT, email TEXT, address TEXT, active INTEGER NOT NULL DEFAULT 1 CHECK(active IN (0,1)),
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE TABLE IF NOT EXISTS products (
  id INTEGER PRIMARY KEY, code TEXT NOT NULL UNIQUE, name TEXT NOT NULL,
  description TEXT, category TEXT, unit TEXT NOT NULL DEFAULT 'unidad',
  initial_stock REAL NOT NULL DEFAULT 0 CHECK(initial_stock >= 0),
  minimum_stock REAL NOT NULL DEFAULT 0 CHECK(minimum_stock >= 0),
  active INTEGER NOT NULL DEFAULT 1 CHECK(active IN (0,1)),
  created_at TEXT NOT NULL DEFAULT (datetime('now')), updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE TABLE IF NOT EXISTS movements (
  id INTEGER PRIMARY KEY, product_id INTEGER NOT NULL REFERENCES products(id),
  supplier_id INTEGER REFERENCES suppliers(id), movement_type TEXT NOT NULL CHECK(movement_type IN ('ENTRY','EXIT')),
  quantity REAL NOT NULL CHECK(quantity > 0), movement_date TEXT NOT NULL,
  reference TEXT, notes TEXT, created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_movements_date ON movements(movement_date);
CREATE INDEX IF NOT EXISTS idx_movements_product ON movements(product_id);
