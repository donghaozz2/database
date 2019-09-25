CREATE OR REPLACE FUNCTION change_name()
RETURNS TRIGGER
AS
$$
BEGIN
	NEW.fname = upper(NEW.fname);
	NEW.lname = upper(NEW.lname);
	RETURN NEW;
END;
$$
language plpgsql;

CREATE TRIGGER ensure_case
BEFORE INSERT OR UPDATE
ON agents
FOR EACH ROW
EXECUTE PROCEDURE change_name();



CREATE OR REPLACE FUNCTION q52()
RETURNS TRIGGER
AS
$$

BEGIN
  IF NEW.url != '' THEN
	   raise notice 'University of % is changing its url',NEW.name;
  END IF;
	RETURN NEW;
END;
$$
language plpgsql;

CREATE TRIGGER tq52
BEFORE INSERT OR UPDATE OR DELETE
ON university
FOR EACH ROW
EXECUTE PROCEDURE q52();
