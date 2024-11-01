SELECT 
    p.id,
    p.name,
    p.price,
    p.category_id,
    p.store_id,
    AVG(r.rating) AS avg_rating,
    SUM(o.quantity) AS total_quantity_sold
FROM
    products p
        JOIN
    categories c ON p.category_id = c.id
        JOIN
    reviews r ON p.id = r.product_id
        JOIN
    orders o ON p.id = o.product_id
WHERE
    p.created_at >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY p.id , p.name , p.price , p.category_id , p.store_id
HAVING avg_rating >= 4
    AND (SELECT 
        COUNT(*)
    FROM
        products p2
    WHERE
        p2.category_id = p.category_id) > 10
ORDER BY total_quantity_sold DESC;