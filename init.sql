CREATE TABLE IF NOT EXISTS signals (
    id       SERIAL PRIMARY KEY,
    signal   VARCHAR(10)  NOT NULL,
    ticker   VARCHAR(20)  NOT NULL,
    interval VARCHAR(10),
    time     TIMESTAMP,
    exchange VARCHAR(20),
    open     NUMERIC(20, 8),
    high     NUMERIC(20, 8),
    low      NUMERIC(20, 8),
    close    NUMERIC(20, 8)
);

CREATE TABLE IF NOT EXISTS orders (
    id               SERIAL PRIMARY KEY,
    "signalId"       VARCHAR(20),
    symbol           VARCHAR(20)  NOT NULL,
    side             VARCHAR(10)  NOT NULL,
    "orderType"      VARCHAR(20),
    qty              NUMERIC(20, 8),
    "orderId"        VARCHAR(50),
    "orderRole"      VARCHAR(20),
    "parentOrderId"  VARCHAR(50),
    "createdAt"      TIMESTAMP    NOT NULL
);
