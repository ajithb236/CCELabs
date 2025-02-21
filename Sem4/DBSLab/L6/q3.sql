CREATE OR REPLACE PROCEDURE display_accidents_by_location(
    p_location IN VARCHAR2
) IS
BEGIN
    FOR rec IN (
        SELECT report_number, accd_date, location
        FROM ACCIDENT
        WHERE location = p_location
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Report Number: ' || rec.report_number ||
                             ', Date: ' || TO_CHAR(rec.accd_date, 'YYYY-MM-DD') ||
                             ', Location: ' || rec.location);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/