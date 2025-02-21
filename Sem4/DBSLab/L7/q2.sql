
SET SERVEROUTPUT ON;


CREATE OR REPLACE TRIGGER update_total_damage
AFTER INSERT OR DELETE ON PARTICIPATED
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    UPDATE ACCIDENT
    SET total_damage = total_damage + :NEW.damage_amt
    WHERE report_number = :NEW.report_number;
  ELSIF DELETING THEN
    UPDATE ACCIDENT
    SET total_damage = total_damage - :OLD.damage_amt
    WHERE report_number = :OLD.report_number;
  END IF;
END;
/