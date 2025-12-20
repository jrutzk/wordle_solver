--black p1 not in ('', '', '', '', '')
--yellow p1 in ('', '', '', '')
--green p1 = ''

--byyyb
SELECT * FROM wordle.guesses_positions_view
where p1 not in ('', '', '', '', '')
and p1 in ('', '', '', '')
and p1 in ('', '', '', '')
and p1 in ('', '', '', '')
and p1 not in ('', '', '', '', '');

--byggb
SELECT * FROM wordle.guesses_positions_view
where p1 not in ('', '', '', '', '')
and p2 in ('','','','')
and p3 = ''
and p4 = ''
and p5 not in ('', '', '', '', '');

--yyyyb
SELECT * FROM wordle.guesses_positions_view
where p1 in ('', '', '', '')
and p2 in ('', '', '', '')
and p3 in ('', '', '', '')
and p4 in ('', '', '', '')
and p5 not in ('', '', '', '', '');

--bybyb
SELECT * FROM wordle.guesses_positions_view
where p1 not in ('', '', '', '', '')
and p2 in ('','','','')
and p3 not in ('', '', '', '', '')
and p4 in ('', '', '', '')
and p5 not in ('', '', '', '', '');
