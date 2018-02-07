CREATE TABLE clienti (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nume VARCHAR(50) NOT NULL,
    prenume VARCHAR(50) NOT NULL,
    telefon VARCHAR(50) NOT NULL,
    localitate VARCHAR(100) NOT NULL
);
CREATE TABLE facturi(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    numar_factura VARCHAR(15) NOT NULL UNIQUE,
    data_factura DATETIME NOT NULL,
    valoare FLOAT NOT NULL,
    moneda VARCHAR(10) NOT NULL,
    id_client INT NOT NULL,
    CONSTRAINT id_client_fk FOREIGN KEY (id_client) REFERENCES clienti(id)
    
);
ALTER TABLE facturi RENAME TO facturi_clienti;
ALTER TABLE facturi_clienti RENAME TO facturi;
ALTER TABLE  facturi CHANGE  data_factura data_factura  DATETIME;
ALTER TABLE clienti CHANGE nume nume VARCHAR(150) NOT NULL;
ALTER TABLE facturi  DROP FOREIGN KEY id_client_fk;
ALTER TABLE facturi ADD CONSTRAINT fk_fact FOREIGN KEY  (id_client) REFERENCES clienti(id);
ALTER TABLE facturi CHANGE valoare valoare FLOAT NOT NULL DEFAULT 0;

