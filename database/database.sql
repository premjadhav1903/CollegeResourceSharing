CREATE DATABASE CollegeResourceSharing;
USE CollegeResourceSharing;

CREATE TABLE Users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(20),
    department VARCHAR(50)
);

CREATE TABLE Categories(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

CREATE TABLE Resources(
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_name VARCHAR(100),
    description TEXT,
    category_id INT,
    owner_id INT,
    availability VARCHAR(20),
    FOREIGN KEY(category_id) REFERENCES Categories(category_id),
    FOREIGN KEY(owner_id) REFERENCES Users(user_id)
);

CREATE TABLE BorrowRequests(
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_id INT,
    borrower_id INT,
    request_date DATE,
    due_date DATE,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY(resource_id) REFERENCES Resources(resource_id),
    FOREIGN KEY(borrower_id) REFERENCES Users(user_id)
);
