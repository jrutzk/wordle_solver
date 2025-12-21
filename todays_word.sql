create table wordle.todays_word
(
word text
);

create or replace view wordle.todays_word_split as
select word,
  substring(word from 1 for 1) as p1,
  substring(word from 2 for 1) as p2,
  substring(word from 3 for 1) as p3,
  substring(word from 4 for 1) as p4,
  substring(word from 5 for 1) as p5
from wordle.todays_word;

insert into wordle.todays_word values ('quilt');

SELECT * FROM wordle.todays_word_split;
