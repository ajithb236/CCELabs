CREATE OR REPLACE FUNCTION get_accidents_by_license(
    p_regno IN VARCHAR2
) RETURN NUMBER IS
    v_accident_count NUMBER := 0;
BEGIN
    -- Count the total number of accidents for the given license
    SELECT COUNT(DISTINCT report_number)
    INTO v_accident_count
    FROM PARTICIPATED
    WHERE regno = p_regno;

    RETURN v_accident_count;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN -1;
END;
/