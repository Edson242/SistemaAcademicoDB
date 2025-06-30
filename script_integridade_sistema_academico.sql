
-- Criação do banco de dados
CREATE DATABASE sistema_academico_integrado;
\c sistema_academico_integrado;

-- Tabela: Escola
CREATE TABLE Escola (
    idesc SERIAL PRIMARY KEY,
    nomesc VARCHAR(100) NOT NULL,
    endesc VARCHAR(100),
    idpro INT
);

-- Tabela: Aluno
CREATE TABLE Aluno (
    idalu SERIAL PRIMARY KEY,
    nomalu VARCHAR(100) NOT NULL,
    CPFalu VARCHAR(14) UNIQUE NOT NULL,
    emailalu VARCHAR(100) UNIQUE NOT NULL,
    idesc INT NOT NULL,
    idhist BIGINT,
    FOREIGN KEY (idesc) REFERENCES Escola(idesc) ON DELETE CASCADE
);

-- Tabela: Disciplina
CREATE TABLE Disciplina (
    id_dis SERIAL PRIMARY KEY,
    nomdis VARCHAR(100) NOT NULL,
    perdis VARCHAR(40),
    idesc INT NOT NULL,
    idalu INT,
    FOREIGN KEY (idesc) REFERENCES Escola(idesc) ON DELETE CASCADE,
    FOREIGN KEY (idalu) REFERENCES Aluno(idalu)
);

-- Tabela: Professor
CREATE TABLE Professor (
    idpro SERIAL PRIMARY KEY,
    nomepro VARCHAR(100) NOT NULL,
    emailpro VARCHAR(100) UNIQUE NOT NULL,
    cpfpro VARCHAR(14) UNIQUE NOT NULL,
    idesc INT NOT NULL,
    id_dis INT,
    idalu INT,
    FOREIGN KEY (idesc) REFERENCES Escola(idesc),
    FOREIGN KEY (id_dis) REFERENCES Disciplina(id_dis),
    FOREIGN KEY (idalu) REFERENCES Aluno(idalu)
);

-- Tabela: Matricula
CREATE TABLE Matricula (
    idmat SERIAL PRIMARY KEY,
    anosem VARCHAR(6) NOT NULL CHECK (char_length(anosem) = 6),
    datmat DATE NOT NULL,
    idalu INT NOT NULL,
    idesc INT NOT NULL,
    idpro INT NOT NULL,
    FOREIGN KEY (idalu) REFERENCES Aluno(idalu),
    FOREIGN KEY (idesc) REFERENCES Escola(idesc),
    FOREIGN KEY (idpro) REFERENCES Professor(idpro)
);

-- Tabela: Historico
CREATE TABLE Historico (
    idhist BIGSERIAL PRIMARY KEY,
    anosem INT NOT NULL,
    nota_final INT CHECK (nota_final BETWEEN 0 AND 100),
    faltas INT CHECK (faltas >= 0),
    percentual_presenca INT CHECK (percentual_presenca BETWEEN 0 AND 100),
    status INT CHECK (status IN (0, 1)), -- 1 = Aprovado, 0 = Reprovado
    idalu2 INT NOT NULL,
    id_dis INT NOT NULL,
    FOREIGN KEY (idalu2) REFERENCES Aluno(idalu),
    FOREIGN KEY (id_dis) REFERENCES Disciplina(id_dis)
);
