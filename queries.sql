SELECT
	POS,
	LETTER,
	COUNT(*)
FROM
	WORDLE.GUESSES_UNPIVOT_VIEW
GROUP BY
	POS,
	LETTER
ORDER BY
	COUNT(*) DESC;

SELECT
	--POS,
	LETTER,
	COUNT(*)
FROM
	WORDLE.GUESSES_UNPIVOT_VIEW
GROUP BY
	--POS,
	LETTER
ORDER BY
	COUNT(*) DESC;

-- CRANE STOUP DIMLY
SELECT
	*
FROM
	wordle.GUESSES_POSITIONS_VIEW
WHERE
	1 = 1
	--AND P1 = ''
	--and p1 not in (select letter from wordle.letters)
	--and p2 = ''
	--and p2 not in (select letter from wordle.letters)
	--and p3 = ''
	--and p3 not in (select letter from wordle.letters)
	--and p4 = ''
	--and p4 not in (select letter from wordle.letters)
	--AND P5 = ''
	--and p5 not in (select letter from wordle.letters)
	;

insert into grey values ('');
insert into yellow values ('');
insert into green values ( , '');

SELECT
	*
FROM
	wordle.ANSWERS_POSITIONS_VIEW
WHERE
	1 = 1
	AND P1 = (select letter from green where position = 1)
	AND P2 = (select letter from green where position = 2)
	AND P3 = (select letter from green where position = 3)
	AND P4 = (select letter from green where position = 4)
	AND P5 = (select letter from green where position = 5)
	and p1 not in (select letter from wordle.grey)
	and p2 not in (select letter from wordle.grey)
	and p3 not in (select letter from wordle.grey)
	and p4 not in (select letter from wordle.grey)
	and p5 not in (select letter from wordle.grey)
	and (select letter from yellow) in (p1, p2, p3, p4, p5)
	and (select letter from yellow) in (p1, p2, p3, p4, p5)
	and (select letter from yellow) in (p1, p2, p3, p4, p5)
	and (select letter from yellow) in (p1, p2, p3, p4, p5)
	and (select letter from yellow) in (p1, p2, p3, p4, p5)
	--
	;
