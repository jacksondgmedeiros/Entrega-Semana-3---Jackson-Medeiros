
SELECT * FROM BRH.PROJETO;

CREATE OR REPLACE PROCEDURE brh.insere_projeto (
    p_id projeto.id%TYPE,
    p_nome projeto.nome%TYPE,
    p_responsavel projeto.responsavel%TYPE,
    p_inicio projeto.inicio%TYPE
) IS
BEGIN
    INSERT INTO projeto (id, nome, responsavel, inicio)
    VALUES (p_id, p_nome, p_responsavel, p_inicio);
    COMMIT;
END;

EXECUTE brh.insere_projeto(6,'Alura','T123', sysdate);

CREATE OR REPLACE FUNCTION BRH.CALCULA_IDADE
    (p_DATA IN DATE)
RETURN
    INTEGER
IS
    v_IDADE INTEGER;
BEGIN

    SELECT SUBSTR((MONTHS_BETWEEN(SYSDATE, p_DATA)/12),1,2) AS IDADE INTO v_IDADE FROM dual;
    
    RETURN v_IDADE;
END;


SELECT BRH.CALCULA_IDADE('03/03/1992') FROM DUAL;



CREATE OR REPLACE FUNCTION brh.finaliza_projeto
(p_ID IN brh.projeto.id%TYPE)
RETURN
    DATE
IS
    v_FIM DATE;
BEGIN
    UPDATE BRH.PROJETO SET FIM = SYSDATE  WHERE ID = p_ID;
    RETURN v_FIM;
END;


set serveroutput ON
DECLARE
    v_FIM brh.projeto.fim%TYPE;
    v_ID brh.projeto.id%type := 6;
BEGIN 
    v_FIM := brh.finaliza_projeto(v_ID);
END;




CREATE OR REPLACE PROCEDURE brh.insere_projeto (
    p_id projeto.id%TYPE,
    p_nome projeto.nome%TYPE,
    p_responsavel projeto.responsavel%TYPE,
    p_inicio projeto.inicio%TYPE
) IS
BEGIN
    IF LENGTH(p_nome) < 2 OR p_nome IS NULL THEN
        dbms_output.put_line('Nome de projeto inválido! Deve ter dois ou mais caracteres.');
      
    ELSE
        INSERT INTO projeto (id, nome, responsavel, inicio)
        VALUES (p_id, p_nome, p_responsavel, p_inicio);
        COMMIT;
    END IF;
END;

EXECUTE brh.insere_projeto(7,'SENAC','A124', sysdate);







