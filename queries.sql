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
