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
