CREATE DATABASE db_parque_publico;
USE db_parque_publico;

CREATE TABLE Visitante (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    nacionalidade VARCHAR(50)
);

CREATE TABLE Telefone_Visitante (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    tipo VARCHAR(20),
    cpf_visitante VARCHAR(11) NOT NULL,
    FOREIGN KEY (cpf_visitante) REFERENCES Visitante(cpf)
);

CREATE TABLE Parque (
    id_parque INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    capacidade INT NOT NULL
);

CREATE TABLE Regiao_Parque (
    id_area INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    capacidade INT,
    id_parque INT NOT NULL,
    FOREIGN KEY (id_parque) REFERENCES Parque(id_parque)
);

CREATE TABLE Escultura (
    id_escultura INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    material VARCHAR(50),
    ano_criacao INT,
    id_area INT NOT NULL,
    FOREIGN KEY (id_area) REFERENCES Regiao_Parque(id_area)
);

CREATE TABLE Agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    data_reserva DATETIME NOT NULL,
    cpf_visitante VARCHAR(11) NOT NULL,
    id_parque INT NOT NULL,
    FOREIGN KEY (cpf_visitante) REFERENCES Visitante(cpf),
    FOREIGN KEY (id_parque) REFERENCES Parque(id_parque)
);

CREATE TABLE Visita_Area (
    id_visita_area INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_entrada DATETIME NOT NULL,
    data_hora_saida DATETIME,
    id_agendamento INT NOT NULL,
    id_area INT NOT NULL,
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento),
    FOREIGN KEY (id_area) REFERENCES Regiao_Parque(id_area)
);

INSERT INTO Parque (nome, capacidade) VALUES 
('Parque das Esculturas Francisco Brennand', 2000);

INSERT INTO Regiao_Parque (nome, capacidade, id_parque) VALUES 
('Cais de Desembarque (Marco Zero)', 100, 1),
('Praça da Torre de Cristal', 500, 1),
('Extensão do Molhe', 300, 1);

INSERT INTO Escultura (nome, material, ano_criacao, id_area) VALUES 
('Torre de Cristal', 'Cerâmica e Bronze', 2000, 2),
('Ovo Primordial', 'Cerâmica', 2000, 2),
('Pelicano', 'Bronze', 2000, 3),
('Coluna de Cristal', 'Cerâmica', 2000, 3),
('Serpente Marinha', 'Bronze', 2000, 3);

INSERT INTO Visitante (cpf, nome, email, nacionalidade) VALUES 
('05544433321', 'Mariana Caldas', 'mari.caldas@recife.com', 'Brasileira'),
('88877766655', 'Pedro Alencar', 'pedro.sp@email.com', 'Brasileira'),
('11122299900', 'John Smith', 'john.smith@ukmail.com', 'Inglesa');

INSERT INTO Telefone_Visitante (numero, tipo, cpf_visitante) VALUES 
('81999991234', 'Celular', '05544433321'),
('11988887777', 'Celular', '88877766655'),
('44770090000', 'Internacional', '11122299900');

INSERT INTO Agendamento (data_reserva, cpf_visitante, id_parque) VALUES 
('2025-11-30 09:30:00', '05544433321', 1),
('2025-11-30 10:00:00', '88877766655', 1),
('2025-11-30 16:00:00', '11122299900', 1);

INSERT INTO Visita_Area (data_hora_entrada, data_hora_saida, id_agendamento, id_area) VALUES 
('2025-11-30 09:35:00', '2025-11-30 09:40:00', 1, 1),
('2025-11-30 09:45:00', '2025-11-30 10:30:00', 1, 2),
('2025-11-30 10:05:00', '2025-11-30 10:10:00', 2, 1),
('2025-11-30 10:15:00', '2025-11-30 10:45:00', 2, 2),
('2025-11-30 10:50:00', '2025-11-30 11:30:00', 2, 3),
('2025-11-30 16:10:00', '2025-11-30 16:15:00', 3, 1),
('2025-11-30 16:20:00', '2025-11-30 17:30:00', 3, 2);
