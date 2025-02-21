CREATE OR REPLACE PROCEDURE find_drivers_without_accidents IS
BEGIN
    FOR rec IN (
        SELECT p.driver_id, p.name, p.address
        FROM PERSON p
        WHERE p.driver_id NOT IN (
            SELECT DISTINCT driver_id
            FROM PARTICIPATED
        )
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Driver ID: ' || rec.driver_id ||
                             ', Name: ' || rec.name ||
                             ', Address: ' || rec.address);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/