
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
  COALESCE(h.faltas, 0) AS "Faltas",
  COALESCE(h.percentual_presenca, 0) AS "Presença (%)"
FROM Aluno_Disciplina ad
JOIN Aluno a ON a.idalu = ad.idalu
LEFT JOIN Historico h ON h.idalu = a.idalu AND h.id_dis = ad.id_dis
WHERE ad.id_dis = ?  -- Substitua pelo ID da disciplina
ORDER BY "Presença (%)" DESC;

-- Relatório Resumido de Aprovação por Disciplina e Período
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
