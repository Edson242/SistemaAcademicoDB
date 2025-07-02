# 🎓 Gestão Acadêmica Integrada e Automatizada (GAIA)

Um sistema de banco de dados para gerenciar matrículas, notas e frequência em instituições de ensino, desenvolvido como trabalho acadêmico para a disciplina de Banco de Dados.

## 📌 Índice
- [Objetivo](#-objetivo)
- [Funcionalidades](#-funcionalidades)
- [Tecnologias](#-tecnologias)
- [Equipe](#-equipe)
- [Modelagem do Banco](#-modelagem-do-banco)
  - [Diagrama ER](#diagrama-er)
  - [Script SQL](#script-sql)
  - [Relatórios SQL](#-relatórios-sql)
- [Licença](#-licença)

## 🎯 Objetivo
Automatizar processos acadêmicos como matrículas, lançamento de notas e geração de relatórios, garantindo:
- Integridade dos dados
- Eficiência nas operações
- Consultas complexas otimizadas

## ✨ Funcionalidades
| Módulo          | Descrição                                                                 |
|-----------------|---------------------------------------------------------------------------|
| Cadastros       | Alunos, professores, disciplinas e turmas                                |
| Matrículas      | Validação de pré-requisitos e lotação de turmas                          |
| Notas/Frequência| Lançamento com cálculos automáticos (médias, situações)                  |
| Relatórios      | Alunos Matriculados, Notas de um Aluno, Frequência dos Alunos em uma Disciplina e Resumo de Aprovação por Disciplina e Período |

## 💻 Tecnologias
**Banco de Dados**:
- ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

**Ferramentas**:
- ![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
- ![Visual Paradigm](https://img.shields.io/badge/Visual%20Paradigm-FFB400?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCAxMjggMTI4IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxnPjxwYXRoIGZpbGw9IiNGRkI0MDAiIGQ9Ik04OC40IDQ3LjMgNzUuMiAzMy45bC00MS42IDQxLjVMMzkuNSA3Mi4zIDUyLjYgODUuN2w0MS43LTQxLjRMODguNCA0Ny4zeiIvPjxwYXRoIGZpbGw9IiM2NjYiIGQ9Ik01Mi42IDg1LjdsMTMuMyAxMy4yIDEzLjMtMTMuMi0xMy4zLTEzLjMtMTMuMyAxMy4zem0tMy4xIDMuMmwzLjEtMy4yIDMuMiAzLjItMy4xIDMuMi0zLjItMy4yek04OC40IDQ3LjNsLTQxLjcgNDEuNC0xMy4xLTEzLjJMMzkuNSA3Mi4zIDUyLjYgODUuN2w0MS43LTQxLjRMODguNCA0Ny4zeiIvPjwvZz48L3N2Zz4=)


## 👥 Equipe
| Nome               |
|--------------------|
| Edson Silveira      |
| Cleverson Mozer        |
| Mauricio Bairos    | 
| Tiago da Luz    | 

## 🗃️ Modelagem do Banco
### Diagrama ER
![Diagrama ER do Sistema Acadêmico](diagrama_er.png)

### Script SQL
```sql
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
```
## 📊 Relatórios SQL

Consultas para análise acadêmica:

### 🔹 Alunos Matriculados (última matrícula por aluno)
```sql
SELECT 
    a.nomalu AS "Nome do Aluno",
    m.idmat AS "Matrícula",
    e.nomesc AS "Curso/Escola"
FROM Matricula m
JOIN Aluno a ON a.idalu = m.idalu
JOIN Escola e ON e.idesc = m.idesc
WHERE m.datmat = (
    SELECT MAX(datmat) 
    FROM Matricula m2 
    WHERE m2.idalu = m.idalu
)
ORDER BY a.nomalu;
```

### 🔹 Notas de um Aluno
```sql
SELECT 
    a.nomalu AS "Nome do Aluno",
    d.nomdis AS "Disciplina",
    h.nota_final AS "Nota Final",
    h.anosem AS "Semestre"
FROM Historico h
JOIN Aluno a ON a.idalu = h.idalu
JOIN Disciplina d ON d.id_dis = h.id_dis
WHERE a.idalu = ? -- Substitua pelo ID do aluno desejado
ORDER BY h.anosem DESC;
```

### 🔹 Frequência dos Alunos em uma Disciplina
```sql
SELECT 
  a.nomalu AS "Nome do Aluno",
  COALESCE(h.faltas, 0) AS "Faltas",
  COALESCE(h.percentual_presenca, 0) AS "Presença (%)"
FROM Aluno_Disciplina ad
JOIN Aluno a ON a.idalu = ad.idalu
LEFT JOIN Historico h ON h.idalu = a.idalu AND h.id_dis = ad.id_dis
WHERE ad.id_dis = ?  -- Substitua pelo ID da disciplina
ORDER BY "Presença (%)" DESC;
```

### 🔹 Resumo de Aprovação por Disciplina e Semestre
```sql
SELECT 
    d.nomdis AS "Disciplina",
    h.anosem AS "Semestre",
    COUNT(*) AS "Total Matriculados",
    SUM(CASE WHEN h.status = 1 THEN 1 ELSE 0 END) AS "Aprovados",
    SUM(CASE WHEN h.status = 0 THEN 1 ELSE 0 END) AS "Reprovados"
FROM Historico h
JOIN Disciplina d ON d.id_dis = h.id_dis
WHERE h.anosem = '' -- Substitua pelo semestre desejado
GROUP BY d.nomdis, h.anosem
ORDER BY "Total Matriculados" DESC;
```



## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

---

> Desenvolvido para a disciplina de Banco de Dados I - Universidade do Oeste de Santa Catarina (2025)
