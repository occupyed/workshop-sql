-- syntax

SELECT DISTINCT
    select_list
FROM
    table_name
WHERE 
    search_condition
ORDER BY 
    sort_expression;
    

-- without distict
SELECT 
    lastname
FROM
    employees
ORDER BY 
    lastname;


-- with distinct
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;


-- takes null
SELECT DISTINCT state
FROM customers;


-- with multiple column
SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;


-- without distinct
SELECT 
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state , 
    city;