SELECT COUNT(*), price as pr FROM CW2DB.places AS p WHERE p.closed = ${var:state} GROUP BY pr;
