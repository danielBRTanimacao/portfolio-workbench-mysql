CREATE VIEW ContasNaoPagas as 
SELECT CR.ID as "ID da conta a receber", 
	C.Nome as "Nome do cliente",
	C.CPF as "CPF do cliente",
	CR.DataVencimento as "Data de vencimento",
	CR.Valor as "Valor do cliente"
FROM ContaReceber CR
JOIN Cliente C on CR.Cliente_ID = C.ID
WHERE CR.Situacao = "1";

SELECT * FROM ContasNaoPagas;
SELECT * FROM ContaReceber;