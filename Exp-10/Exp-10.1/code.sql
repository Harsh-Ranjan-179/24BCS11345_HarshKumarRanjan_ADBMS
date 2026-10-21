SELECT f_name, f_cost, f_type
FROM food
WHERE f_cost > (
    SELECT AVG(f_cost)
    FROM food
);