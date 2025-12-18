create table wordle.yellow
(
position int,
letter char
);

create table wordle.green
(
position int,
letter char
);

ALTER TABLE WORDLE.GREEN
ADD CONSTRAINT GREEN_POS_UQ UNIQUE (POSITION);

create table wordle.grey
(
letter char
);

create table wordle.guessed_letters
(
color text,
position int,
letter char
);
