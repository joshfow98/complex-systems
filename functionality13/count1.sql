SELECT COUNT(*) from coursework.places AS p LEFT JOIN coursework.reviews AS r ON p.gplusplaceid = r.gplusplaceid WHERE p.price = '\$'

