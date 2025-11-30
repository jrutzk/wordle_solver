create or replace view wordle.guesses_positions_view as
select guess,
  substring(guess from 1 for 1) as p1,
  substring(guess from 2 for 1) as p2,
  substring(guess from 3 for 1) as p3,
  substring(guess from 4 for 1) as p4,
  substring(guess from 5 for 1) as p5
from wordle.guesses;
