create or replace view wordle.guesses_unpivot_view as SELECT
	guess,
	GS.POS,
	LETTERS[GS.POS] AS LETTER
FROM
	(
		SELECT
			guess,
			ARRAY[p1, p2, p3, p4, p5] AS LETTERS
		FROM
			wordle.guesses_positions_view
	) T
	CROSS JOIN LATERAL GENERATE_SUBSCRIPTS(T.LETTERS, 1) AS GS (POS)
ORDER BY
	guess,
	POS;
