/*
Numeric Types:

INT: A normal-sized integer, typically used for primary keys.
TINYINT, SMALLINT, MEDIUMINT, BIGINT: Integers with varying storage sizes.
FLOAT, DOUBLE: Floating-point numbers for approximate values.
DECIMAL: Fixed-point numbers for exact values, suitable for monetary calculations.

String Types:

CHAR: Fixed-length string.
VARCHAR: Variable-length string, suitable for storing strings with varying lengths.
TEXT: Variable-length string with a maximum length of 65,535 characters.
BLOB: Binary Large Object for storing large binary data like images, videos, etc.
ENUM: Enumeration type for specifying a set of predefined values.

Date and Time Types:

DATE: Date value in the format YYYY-MM-DD.
TIME: Time value in the format HH:MM:SS.
DATETIME: Combination of date and time in the format YYYY-MM-DD HH:MM:SS.
TIMESTAMP: Similar to DATETIME but stores the timestamp in UTC and automatically converts to the session's time zone.

Spatial Types:

GEOMETRY: For spatial values representing geometric objects.
POINT: Represents a point in a coordinate space.
LINESTRING: Represents a sequence of points and straight lines.
POLYGON: Represents a closed polygonal area.

Miscellaneous Types:

JSON: Stores JSON data.
SET: A string object that can have zero or more values, chosen from a list of permitted values specified when the table is created.
*/

-- numeric
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    age TINYINT,
    height FLOAT,
    balance DECIMAL(10, 2)
);


-- string
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    image BLOB
);

-- datetime
CREATE TABLE events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_date DATE,
    start_time TIME,
    created_at DATETIME,
    updated_at TIMESTAMP
);

-- spatial
CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    coordinates POINT
);


-- Miscellaneous 
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    skills SET('Python', 'Java', 'SQL', 'JavaScript'),
    info JSON
);
