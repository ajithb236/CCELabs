CREATE OR REPLACE FUNCTION get_total_accidents(p_year IN NUMBER) RETURN NUMBER IS
    v_total_accidents NUMBER := 0;
BEGIN
    -- Count the number of accidents for the given year
    SELECT COUNT(*)
    INTO v_total_accidents
    FROM ACCIDENT
    WHERE EXTRACT(YEAR FROM accd_date) = p_year;

    RETURN v_total_accidents;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN -1;
END;
/
