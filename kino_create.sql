-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-12-12 06:42:33.34

-- tables
-- Table: Konto
CREATE TABLE Konto (
    id int identity(1,1) NOT NULL,
    kasutajanimi varchar(50)  NOT NULL,
    email int  NOT NULL,
    parool int  NOT NULL,
    CONSTRAINT Konto_pk PRIMARY KEY (id)
);

-- Table: Piletid
CREATE TABLE Piletid (
    id int identity(1,1) NOT NULL,
    Seanssid_id int  NOT NULL,
    Konto_id int  NOT NULL,
    kohad_id int  NOT NULL,
    CONSTRAINT Piletid_pk PRIMARY KEY (id)
);

-- Table: Saalid
CREATE TABLE Saalid (
    id int identity(1,1) NOT NULL,
    Nimetus int  NOT NULL,
    Tuup int  NOT NULL,
    CONSTRAINT Saalid_pk PRIMARY KEY (id)
);

-- Table: Seanssid
CREATE TABLE Seanssid (
    id int identity(1,1) NOT NULL,
    SeanssiDate date  NOT NULL,
    keel varchar(50)  NOT NULL,
    Saalid_id int  NOT NULL,
    film_id int  NOT NULL,
    CONSTRAINT Seanssid_pk PRIMARY KEY (id)
);

-- Table: film
CREATE TABLE film (
    id int identity(1,1) NOT NULL,
    nimi varchar(50)  NOT NULL,
    poster varbinary(MAX)  NOT NULL,
    aasta date  NOT NULL,
    CONSTRAINT film_pk PRIMARY KEY (id)
);

-- Table: kohad
CREATE TABLE kohad (
    id int identity(1,1) NOT NULL,
    rida int  NOT NULL,
    koha_number int  NOT NULL,
    Saalid_id int  NOT NULL,
    status BIT NOT NULL,
    CONSTRAINT kohad_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Piletid_Konto (table: Piletid)
-- Reference: Piletid_Konto (table: Piletid)
ALTER TABLE Piletid
ADD CONSTRAINT Piletid_Konto FOREIGN KEY (Konto_id)
    REFERENCES Konto (id);

-- Reference: Piletid_Seanssid (table: Piletid)
ALTER TABLE Piletid
ADD CONSTRAINT Piletid_Seanssid FOREIGN KEY (Seanssid_id)
    REFERENCES Seanssid (id);

-- Reference: Piletid_kohad (table: Piletid)
ALTER TABLE Piletid
ADD CONSTRAINT Piletid_kohad FOREIGN KEY (kohad_id)
    REFERENCES kohad (id);

-- Reference: Seanssid_Saalid (table: Seanssid)
ALTER TABLE Seanssid
ADD CONSTRAINT Seanssid_Saalid FOREIGN KEY (Saalid_id)
    REFERENCES Saalid (id);

-- Reference: Seanssid_film (table: Seanssid)
ALTER TABLE Seanssid
ADD CONSTRAINT Seanssid_film FOREIGN KEY (film_id)
    REFERENCES film (id);

-- Reference: kohad_Saalid (table: kohad)
ALTER TABLE kohad
ADD CONSTRAINT kohad_Saalid FOREIGN KEY (Saalid_id)
    REFERENCES Saalid (id);

-- End of file.

select * from kohad;
INSERT INTO Saalid (Nimetus, Tuup)
VALUES (1, 1);

DECLARE @Saalid_id INT = 2;  
DECLARE @status BIT = 1;  

INSERT INTO kohad (rida, koha_number, Saalid_id, status)
VALUES 
(1, 1, @Saalid_id, @status),
(1, 2, @Saalid_id, @status),
(1, 3, @Saalid_id, @status),
(1, 4, @Saalid_id, @status),
(1, 5, @Saalid_id, @status),

(2, 1, @Saalid_id, @status),
(2, 2, @Saalid_id, @status),
(2, 3, @Saalid_id, @status),
(2, 4, @Saalid_id, @status),
(2, 5, @Saalid_id, @status),

(3, 1, @Saalid_id, @status),
(3, 2, @Saalid_id, @status),
(3, 3, @Saalid_id, @status),
(3, 4, @Saalid_id, @status),
(3, 5, @Saalid_id, @status),

(4, 1, @Saalid_id, @status),
(4, 2, @Saalid_id, @status),
(4, 3, @Saalid_id, @status),
(4, 4, @Saalid_id, @status),
(4, 5, @Saalid_id, @status),

(5, 1, @Saalid_id, @status),
(5, 2, @Saalid_id, @status),
(5, 3, @Saalid_id, @status),
(5, 4, @Saalid_id, @status),
(5, 5, @Saalid_id, @status);
DELETE FROM kohad;
