\c lunchly

DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name text NOT NULL,
    last_name text NOT NULL,
    phone text,
    notes text DEFAULT '' NOT NULL
);

CREATE TABLE reservations (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    customer_id integer NOT NULL REFERENCES customers,
    start_at timestamp without time zone NOT NULL,
    num_guests integer NOT NULL,
    notes text DEFAULT '' NOT NULL,
    CONSTRAINT reservations_num_guests_check CHECK ((num_guests > 0))
);

INSERT INTO customers (first_name, last_name, phone, notes)
VALUES
('Anthony',	'Gonzales',	'590-813-4874x723',	'Money voice rate chair war subject kid.'),
('Joseph',	'Wells'	,'\N',	'Else quite deal culture deep candidate exactly.');

INSERT INTO reservations (customer_id, start_at, num_guests, notes)
VALUES
	(1,	'2018-09-08 12:20:07-07',	2,    'Decade college home heart.'),
	(2,	'2018-06-18 19:31:59-07',	5, 'Decade college home heart.');