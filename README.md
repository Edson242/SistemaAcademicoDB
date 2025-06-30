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
- [Como Executar](#-como-executar)
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
| Relatórios      | Boletins, listas de classe, histórico escolar                            |

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
```

## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

---

> Desenvolvido para a disciplina de Banco de Dados I - Universidade do Oeste de Santa Catarina (2025)
