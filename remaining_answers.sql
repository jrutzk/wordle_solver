CREATE OR REPLACE VIEW WORDLE.REMAINING_ANSWERS_VIEW AS
SELECT
	ANSWERS,
	P1,
	P2,
	P3,
	P4,
	P5
FROM
    wordle.answers_positions_view a
WHERE
    1 = 1
-- ======================
-- wordle.green: must match exact position (if present)
-- ======================
AND (
    NOT EXISTS (SELECT 1 FROM wordle.green g WHERE g.position = 1)
    OR EXISTS (
        SELECT 1 FROM wordle.green g
        WHERE g.position = 1 AND a.p1 ILIKE g.letter
    )
)
AND (
    NOT EXISTS (SELECT 1 FROM wordle.green g WHERE g.position = 2)
    OR EXISTS (
        SELECT 1 FROM wordle.green g
        WHERE g.position = 2 AND a.p2 ILIKE g.letter
    )
)
AND (
    NOT EXISTS (SELECT 1 FROM wordle.green g WHERE g.position = 3)
    OR EXISTS (
        SELECT 1 FROM wordle.green g
        WHERE g.position = 3 AND a.p3 ILIKE g.letter
    )
)
AND (
    NOT EXISTS (SELECT 1 FROM wordle.green g WHERE g.position = 4)
    OR EXISTS (
        SELECT 1 FROM wordle.green g
        WHERE g.position = 4 AND a.p4 ILIKE g.letter
    )
)
AND (
    NOT EXISTS (SELECT 1 FROM wordle.green g WHERE g.position = 5)
    OR EXISTS (
        SELECT 1 FROM wordle.green g
        WHERE g.position = 5 AND a.p5 ILIKE g.letter
    )
)
-- ======================
-- wordle.grey: letter must not appear anywhere
-- ======================
AND a.p1 NOT IN (SELECT letter FROM wordle.grey)
AND a.p2 NOT IN (SELECT letter FROM wordle.grey)
AND a.p3 NOT IN (SELECT letter FROM wordle.grey)
AND a.p4 NOT IN (SELECT letter FROM wordle.grey)
AND a.p5 NOT IN (SELECT letter FROM wordle.grey)
-- ======================
-- wordle.yellow: NOT in same position
-- ======================
AND NOT EXISTS (
    SELECT 1 FROM wordle.yellow y
    WHERE y.position = 1 AND a.p1 ILIKE y.letter
)
AND NOT EXISTS (
    SELECT 1 FROM wordle.yellow y
    WHERE y.position = 2 AND a.p2 ILIKE y.letter
)
AND NOT EXISTS (
    SELECT 1 FROM wordle.yellow y
    WHERE y.position = 3 AND a.p3 ILIKE y.letter
)
AND NOT EXISTS (
    SELECT 1 FROM wordle.yellow y
    WHERE y.position = 4 AND a.p4 ILIKE y.letter
)
AND NOT EXISTS (
    SELECT 1 FROM wordle.yellow y
    WHERE y.position = 5 AND a.p5 ILIKE y.letter
)
-- ======================
-- wordle.yellow: must appear elsewhere
-- ======================
AND (
    NOT EXISTS (SELECT 1 FROM wordle.yellow y WHERE y.position = 1)
    OR EXISTS (
        SELECT 1 FROM wordle.yellow y
        WHERE y.position = 1
          AND y.letter ILIKE ANY (ARRAY[a.p2, a.p3, a.p4, a.p5])
    )
)
AND (
    NOT EXISTS (SELECT 1 FROM wordle.yellow y WHERE y.position = 2)
    OR EXISTS (
        SELECT 1 FROM wordle.yellow y
        WHERE y.position = 2
          AND y.letter ILIKE ANY (ARRAY[a.p1, a.p3, a.p4, a.p5])
    )
)
AND (
    NOT EXISTS (SELECT 1 FROM wordle.yellow y WHERE y.position = 3)
    OR EXISTS (
        SELECT 1 FROM wordle.yellow y
        WHERE y.position = 3
          AND y.letter ILIKE ANY (ARRAY[a.p1, a.p2, a.p4, a.p5])
    )
)
AND (
    NOT EXISTS (SELECT 1 FROM wordle.yellow y WHERE y.position = 4)
    OR EXISTS (
        SELECT 1 FROM wordle.yellow y
        WHERE y.position = 4
          AND y.letter ILIKE ANY (ARRAY[a.p1, a.p2, a.p3, a.p5])
    )
)
AND (
    NOT EXISTS (SELECT 1 FROM wordle.yellow y WHERE y.position = 5)
    OR EXISTS (
        SELECT 1 FROM wordle.yellow y
        WHERE y.position = 5
          AND y.letter ILIKE ANY (ARRAY[a.p1, a.p2, a.p3, a.p4])
    )
);

--OLD
CREATE OR REPLACE VIEW WORDLE.REMAINING_ANSWERS AS
SELECT
	*
FROM
	ANSWERS_POSITIONS_VIEW
WHERE
	1 = 1
	AND P1 ilike (select letter from green where position = 1)
	AND P2 ilike (select letter from green where position = 2)
	AND P3 ilike (select letter from green where position = 3)
	AND P4 ilike (select letter from green where position = 4)
	AND P5 ilike (select letter from green where position = 5)
	and p1 not in (select letter from wordle.grey)
	and p2 not in (select letter from wordle.grey)
	and p3 not in (select letter from wordle.grey)
	and p4 not in (select letter from wordle.grey)
	and p5 not in (select letter from wordle.grey)	
	and ((select letter from yellow where position = 1) ilike any (array[p2, p3, p4, p5]) OR (select letter from yellow where position = 1) is null)
	and ((select letter from yellow where position = 2) ilike any (array[p1, p3, p4, p5]) OR (select letter from yellow where position = 2) is null)
	and ((select letter from yellow where position = 3) ilike any (array[p1, p2, p4, p5]) OR (select letter from yellow where position = 3) is null)
	and ((select letter from yellow where position = 4) ilike any (array[p1, p2, p3, p5]) OR (select letter from yellow where position = 4) is null)
	and ((select letter from yellow where position = 5) ilike any (array[p1, p2, p3, p4]) OR (select letter from yellow where position = 5) is null)
	--
	;
