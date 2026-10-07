CREATE TABLE Salary_Hike (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER(10,2)
);

INSERT INTO Salary_Hike VALUES (1, 'Amit', 30000);
INSERT INTO Salary_Hike VALUES (2, 'Ravi', 40000);
INSERT INTO Salary_Hike VALUES (3, 'Neha', 50000);

COMMIT;

CREATE OR REPLACE TRIGGER check_salary_hike
BEFORE UPDATE OF salary ON Salary_Hike
FOR EACH ROW
DECLARE
    salary_limit_exceeded EXCEPTION;
BEGIN
    IF :NEW.salary > :OLD.salary * 1.15 THEN
        RAISE salary_limit_exceeded;
    END IF;

EXCEPTION
    WHEN salary_limit_exceeded THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary increase cannot exceed 15% of the old salary.'
        );
END;
/
