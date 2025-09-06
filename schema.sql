CREATE TABLE loja (
    id_loja SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);


CREATE TABLE jogo (
    id_jogo SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_lancamento INT,
    genero VARCHAR(50) NOT NULL
);


CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL, 
    cidade VARCHAR(100) NOT NULL
);


CREATE TABLE compra (
    id_compra SERIAL PRIMARY KEY,
    data_compra DATE NOT NULL DEFAULT CURRENT_DATE,
    id_cliente INT NOT NULL,
    id_loja INT NOT NULL,
    CONSTRAINT fk_compra_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente)
        ON DELETE CASCADE,
    CONSTRAINT fk_compra_loja FOREIGN KEY (id_loja)
        REFERENCES loja (id_loja)
        ON DELETE CASCADE
);

CREATE TABLE compra_jogo (
    id_compra INT NOT NULL,
    id_jogo INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    PRIMARY KEY (id_compra, id_jogo),
    CONSTRAINT fk_cj_compra FOREIGN KEY (id_compra)
        REFERENCES compra (id_compra)
        ON DELETE CASCADE,
    CONSTRAINT fk_cj_jogo FOREIGN KEY (id_jogo)
        REFERENCES jogo (id_jogo)
        ON DELETE CASCADE
);
