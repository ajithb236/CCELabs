CREATE OR REPLACE PROCEDURE display_total_damage(
    p_driver_id IN VARCHAR2,
    p_year IN NUMBER
) IS
    v_total_damage NUMBER := 0;
BEGIN
    -- Calculate the total damage for the driver in the specified year
    SELECT NVL(SUM(damage_amt), 0)
    INTO v_total_damage
    FROM PARTICIPATED p
    JOIN ACCIDENT a ON p.report_number = a.report_number
    WHERE p.driver_id = p_driver_id AND EXTRACT(YEAR FROM a.accd_date) = p_year;

    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Total damage caused by driver ' || p_driver_id || ' in year ' || p_year || ': ' || v_total_damage);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/