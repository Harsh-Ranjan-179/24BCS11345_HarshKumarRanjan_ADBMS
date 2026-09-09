
CREATE TABLE ORDERS (
    ORDER_ID NUMBER PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(100),
    AMOUNT NUMBER(10,2)
);
INSERT INTO ORDERS VALUES (1, 'Rahul', 5000);
INSERT INTO ORDERS VALUES (2, 'Amit', 15000);
INSERT INTO ORDERS VALUES (3, 'Priya', 8000);
INSERT INTO ORDERS VALUES (4, 'Neha', 25000);
INSERT INTO ORDERS VALUES (5, 'Rohit', 12000);
INSERT INTO ORDERS VALUES (6, 'Anjali', 7500);
INSERT INTO ORDERS VALUES (7, 'Vikas', 30000);
COMMIT;

DECLARE
    CURSOR order_cursor IS
        SELECT ORDER_ID, AMOUNT
        FROM ORDERS;

    V_ORDER_ID ORDERS.ORDER_ID%TYPE;
    V_AMOUNT ORDERS.AMOUNT%TYPE;

BEGIN
    OPEN order_cursor;

    LOOP
        FETCH order_cursor INTO V_ORDER_ID, V_AMOUNT;

        EXIT WHEN order_cursor%NOTFOUND;

        IF V_AMOUNT > 10000 THEN
            DBMS_OUTPUT.PUT_LINE(
                'Order ID: ' || V_ORDER_ID ||
                ' - High Value'
            );
        END IF;

    END LOOP;

    CLOSE order_cursor;

END;
/