
-- Relatório de Alunos Matriculados
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

-- Relatório de Notas de um Aluno
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

-- Relatório de Frequência dos Alunos em uma Disciplina
SELECT 
    a.nomalu AS "Nome do Aluno",
    h.faltas AS "Faltas",
    h.percentual_presenca AS "Presença (%)"
FROM Historico h
JOIN Aluno a ON a.idalu = h.idalu
WHERE h.id_dis = ? -- Substitua pelo ID da disciplina
ORDER BY h.percentual_presenca DESC;

-- Relatório Resumido de Aprovação por Disciplina e Período
SELECT 
    d.nomdis AS "Disciplina",
    h.anosem AS "Semestre",
    COUNT(*) AS "Total Matriculados",
    SUM(CASE WHEN h.status = 'Aprovado' THEN 1 ELSE 0 END) AS "Aprovados",
    SUM(CASE WHEN h.status = 'Reprovado' THEN 1 ELSE 0 END) AS "Reprovados"
FROM Historico h
JOIN Disciplina d ON d.id_dis = h.id_dis
WHERE h.anosem = '2024-2' -- Substitua pelo semestre desejado
GROUP BY d.nomdis, h.anosem
ORDER BY "Total Matriculados" DESC;
