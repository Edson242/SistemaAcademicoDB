# 🎓 Sistema de Gestão Acadêmica (SGA)

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
- ![QuickDBD](https://img.shields.io/badge/QuickDBD-FF6C37?style=for-the-badge)

**Backend**:
- ![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white) + Flask
- ![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-FF6C37?style=for-the-badge)

**Frontend**:
- ![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)

**Ferramentas**:
- ![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
- ![Draw.io](https://img.shields.io/badge/Draw.io-FF6C37?style=for-the-badge)

## 👥 Equipe
| Nome               | Função                | Contato                  |
|--------------------|-----------------------|--------------------------|
| Edson Silveira      | Frontend       | edsonsilveira619@gmail.com           |
| Cleverson Mozer        | Backend             | x@gmail.com          |
| Mauricio Bairos    | Modelagem do BD               | x@gmail.com         |
| Tiago da Luz    | Modelagem do BD               | x@gmail.com         |

## 🗃️ Modelagem do Banco
### Diagrama ER
![Diagrama ER do Sistema Acadêmico](docs/diagrama_er.png)

### Script SQL
```sql
-- Exemplo: Tabela de Alunos
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- Tabela de Matrículas (Relacionamento N:M)
CREATE TABLE matricula (
    id_aluno INTEGER REFERENCES aluno(id),
    id_disciplina INTEGER REFERENCES disciplina(id),
    ano_semestre VARCHAR(6) NOT NULL,
    PRIMARY KEY (id_aluno, id_disciplina, ano_semestre)
);
```

## 🚀 Como Executar
1. **Pré-requisitos**:
   - PostgreSQL 14+
   - Python 3.10+

2. **Instalação**:
   ```bash
   git clone https://github.com/seu-usuario/sistema-academico.git
   cd sistema-academico
   pip install -r requirements.txt
   ```

3. **Configuração**:
   - Renomeie `.env.example` para `.env` e preencha com suas credenciais do banco.

4. **Execução**:
   ```bash
   python app.py
   ```

## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

---

> Desenvolvido para a disciplina de Banco de Dados I - Universidade do Oeste de Santa Catarina (2025)
