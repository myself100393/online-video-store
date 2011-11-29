-- To get all rented movies info from an user id
--SELECT
--	m.name,
--	m.rent_amount,
--	r.date
--FROM	rentals r
--		JOIN movies m
--			ON r.id_movies = m.id
--WHERE
--	r.id_persons = 1;

-- To get all returned movies by an user id in a particular month
--SELECT
--	m.name,
--	m.rent_amount,
--	r.date,
--	r.status
--FROM	rental r
--		JOIN movies m
--			ON r.id_movies = m.id
--WHERE
--	r.date >= 'yyyy-MM-dd'
--AND
--	r.date < 'yyyy-MM-dd'
--AND
--	m.id_persons = 1;

SELECT m.name, m.rent_amount, r.date, r.status
FROM rentals r JOIN movies m ON r.id_movies = m.id
WHERE r.date >= '2011-11-01' AND r.date < ? AND r.id_persons = ?;