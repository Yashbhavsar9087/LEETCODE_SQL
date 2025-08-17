SELECT product_id, product_name, description
FROM products
WHERE REGEXP_LIKE (description, '\\bS[N][0-9]{4}-[0-9]{4}\\b', 'c')
ORDER BY product_id;