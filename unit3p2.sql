CREATE TABLE RESULT (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50),
    result VARCHAR2(20)
);
INSERT INTO RESULT VALUES (1, 'Rahul', 'PASS');
INSERT INTO RESULT VALUES (2, 'Priya', 'PASS');
INSERT INTO RESULT VALUES (3, 'Amit', 'FAIL');
INSERT INTO RESULT VALUES (4, 'Neha', 'PASS');

COMMIT;
SET SERVEROUTPUT ON;

DECLARE
    v_name   RESULT.student_name%TYPE;
    v_result RESULT.result%TYPE;

BEGIN
    
    v_name := '&student_name';
 
    SELECT result
    INTO v_result
    FROM RESULT
    WHERE student_name = v_name;
   
    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student does not exist in the RESULT table.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple records found for this student.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
