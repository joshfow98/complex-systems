SELECT count(r.gplusplaceid) AS total_reviews, r.gplusplaceid, p.name FROM coursework.reviews AS r LEFT JOIN coursework.places AS p ON r.gplusplaceid = p.gplusplaceid GROUP BY p.name, r.gplusplaceid ORDER BY total_reviews DESC LIMIT 1

