create or replace view wordle.answers_positions_view as
select answers,
  substring(answers from 1 for 1) as p1,
  substring(answers from 2 for 1) as p2,
  substring(answers from 3 for 1) as p3,
  substring(answers from 4 for 1) as p4,
  substring(answers from 5 for 1) as p5
from wordle.answers;



create or replace view wordle.answers_unpivot_view as
SELECT
	answers,
	GS.POS,
	LETTERS[GS.POS] AS LETTER
FROM
	(
		SELECT
			answers,
			ARRAY[p1, p2, p3, p4, p5] AS LETTERS
		FROM
			wordle.answers_positions_view
	) T
	CROSS JOIN LATERAL GENERATE_SUBSCRIPTS(T.LETTERS, 1) AS GS (POS)
ORDER BY
	answers,
	POS;
