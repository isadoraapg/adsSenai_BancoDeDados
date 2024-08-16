SELECT p.CodCurso, p.CodPessoa, p.Nome, m.NomeMunicipio, p.rg
FROM pessoa p
INNER JOIN municipio m ON m.CodMunicipio = p.CodMunicipio
WHERE p.rg = 4648651;

CREATE INDEX IDX_rg ON Pessoa(rg);