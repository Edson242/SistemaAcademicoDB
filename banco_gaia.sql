
-- Criação do banco de dados
CREATE DATABASE sistema_academico_integrado;
\c sistema_academico_integrado;
-- Tabela: Escola
CREATE TABLE Escola (
    idesc SERIAL PRIMARY KEY,
    nomesc VARCHAR(100) NOT NULL,
    endesc VARCHAR(100),
);

-- Tabela: Aluno
CREATE TABLE Aluno (
    idalu SERIAL PRIMARY KEY,
    nomalu VARCHAR(100) NOT NULL,
    CPFalu VARCHAR(14) UNIQUE NOT NULL,
    emailalu VARCHAR(100) UNIQUE NOT NULL,
    idesc BIGINT UNSIGNED NOT NULL,
    idhist BIGINT UNSIGNED,
    FOREIGN KEY (idesc) REFERENCES Escola(idesc) ON DELETE cascade
);

-- Tabela: Disciplina
CREATE TABLE Disciplina (
    id_dis SERIAL PRIMARY KEY,
    nomdis VARCHAR(100) NOT NULL,
    perdis VARCHAR(40),
    idesc BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (idesc) REFERENCES Escola(idesc) ON DELETE CASCADE
);

-- Tabela: Aluno_Disciplina
CREATE TABLE Aluno_Disciplina (
    idalu BIGINT UNSIGNED NOT NULL,
    id_dis BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (idalu, id_dis),
    FOREIGN KEY (idalu) REFERENCES Aluno(idalu) ON DELETE CASCADE,
    FOREIGN KEY (id_dis) REFERENCES Disciplina(id_dis) ON DELETE CASCADE
);


-- Tabela: Professor
CREATE TABLE Professor (
    idpro SERIAL PRIMARY KEY,
    nomepro VARCHAR(100) NOT NULL,
    emailpro VARCHAR(100) UNIQUE NOT NULL,
    cpfpro VARCHAR(14) UNIQUE NOT NULL,
    idesc BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (idesc) REFERENCES Escola(idesc),
);

-- Tabela: Professor_Escola
CREATE TABLE Professor_Escola (
    idpro BIGINT UNSIGNED NOT NULL,
    idesc BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (idpro, idesc),
    FOREIGN KEY (idpro) REFERENCES Professor(idpro) ON DELETE CASCADE,
    FOREIGN KEY (idesc) REFERENCES Escola(idesc) ON DELETE CASCADE
);


-- Tabela: Matricula
CREATE TABLE Matricula (
    idmat SERIAL PRIMARY KEY,
    anosem VARCHAR(6) NOT NULL CHECK (char_length(anosem) = 6),
    datmat DATE NOT NULL,
    idalu BIGINT UNSIGNED NOT NULL,
    idesc BIGINT UNSIGNED NOT NULL,
    idpro BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (idalu) REFERENCES Aluno(idalu),
    FOREIGN KEY (idesc) REFERENCES Escola(idesc),
    FOREIGN KEY (idpro) REFERENCES Professor(idpro)
);

-- Tabela: Historico
CREATE TABLE Historico (
    idhist SERIAL PRIMARY KEY,
    anosem INT NOT NULL,
    nota_final INT CHECK (nota_final BETWEEN 0 AND 100),
    faltas INT CHECK (faltas >= 0),
    percentual_presenca INT CHECK (percentual_presenca BETWEEN 0 AND 100),
    status INT CHECK (status IN (0, 1)), -- 1 = Aprovado, 0 = Reprovado
    idalu BIGINT UNSIGNED NOT NULL,
    id_dis BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (idalu) REFERENCES Aluno(idalu),
    FOREIGN KEY (id_dis) REFERENCES Disciplina(id_dis)
);
