CREATE OR REPLACE PROCEDURE wordle.reset()
LANGUAGE plpgsql
AS $$
BEGIN
    TRUNCATE TABLE wordle.yellow;
    UPDATE wordle.green
    SET letter = '_';
    TRUNCATE TABLE wordle.grey;
END;
$$;
