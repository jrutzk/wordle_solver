--THIEF

--byyyb
SELECT * FROM wordle.guesses_positions_view
where p1 not in ('t', 'h', 'i', 'e', 'f')
and p2 in ('t','i', 'e','f')
and p3 in ('t','h', 'e','f')
and p4 in ('t', 'h', 'i', 'f')
and p5 not in ('t', 'h', 'i', 'e', 'f');

--byggb
SELECT * FROM wordle.guesses_positions_view
where p1 not in ('t', 'h', 'i', 'e', 'f')
and p2 in ('t','i','e','f')
and p3 = 'i'
and p4 = 'f'
and p5 not in ('t', 'h', 'i', 'e', 'f');

--yyyyb
SELECT * FROM wordle.guesses_positions_view
where p1 in ('h', 'i', 'e', 'f')
and p2 in ('t', 'i', 'e', 'f')
and p3 in ('t', 'h', 'e', 'f')
and p4 in ('t', 'h', 'i', 'f')
and p5 not in ('t', 'h', 'i', 'e', 'f');

--bybyb
SELECT * FROM wordle.guesses_positions_view
where p1 not in ('t', 'h', 'i', 'e', 'f')
and p2 in ('t','i','e','f')
and p3 not in ('t', 'h', 'i', 'e', 'f')
and p4 in ('t', 'h', 'i', 'f')
and p5 not in ('t', 'h', 'i', 'e', 'f');
