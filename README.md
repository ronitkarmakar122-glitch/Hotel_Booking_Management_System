🏨 RK Hotel Management – SQL Project

A relational database project for a hotel management system, built with MySQL. It covers database design, sample data, and a wide range of SQL queries, from basic joins to subqueries, window functions, and views.

📌 Table of Contents
Overview
Database Schema
Tables
SQL Concepts Covered
Sample Queries
Views
Getting Started
Repository Structure
Future Improvements
Author
📖 Overview

RKHotel models the core operations of a hotel:

Managing customers and their details
Maintaining rooms with type, capacity, pricing, and status
Recording bookings with check-in/check-out dates
Tracking payments by method
Collecting customer reviews and ratings

The database is pre-loaded with 25 records per table, so every query can be run and tested straight away.

🗂 Database Schema
makes is reserved in is paid by receives writes CUSTOMER int customer_id PK varchar first_name varchar last_name enum gender varchar email UK varchar phone_no BOOKING int booking_id PK date check_in_date date check_out_date date booking_date decimal total_amount int room_id FK int customer_id FK ROOM int room_id PK int room_no UK varchar room_type varchar

📋 Tables
Table	Description	Key Columns
customer	Guest information	customer_id, first_name, last_name, gender, email, phone_no
room	Room inventory and pricing	room_id, room_no, room_type, room_status, capacity, price_per_night, ac
booking	Reservations linking customers to rooms	booking_id, check_in_date, check_out_date, total_amount, room_id, customer_id
payment	Payment records for bookings	payment_id, booking_id, payment_date, amount, payment_method
review	Guest feedback and ratings	review_id, booking_id, customer_id, rating, comment

Room types: Single, Double, Deluxe, Family, Suite Room statuses: Available, Booked, Maintenance Payment methods: UPI, Credit Card, Debit Card, Net Banking, Cash

🧠 SQL Concepts Covered
DDL: CREATE DATABASE, CREATE TABLE, ALTER TABLE (rename and modify columns), DESC
DML: INSERT, SELECT
Constraints: Primary Key, Foreign Key, Unique, ENUM
Joins: INNER JOIN, LEFT JOIN, multi-table joins
Subqueries: scalar subqueries, IN, ANY, nested subqueries
Aggregate functions: MAX(), AVG()
Window functions: RANK(), DENSE_RANK(), ROW_NUMBER()
Views: reusable virtual tables for reporting
🔍 Sample Queries
1. Customer name with room number and stay dates
sql
SELECT c.first_name, c.last_name, r.room_no, b.check_in_date, b.check_out_date
FROM customer c
JOIN booking b ON c.customer_id = b.customer_id
JOIN room r ON b.room_id = r.room_id;
2. Payment report
sql
SELECT c.first_name, c.last_name, p.amount AS payment_amount,
       p.payment_method, p.payment_date
FROM customer c
JOIN booking b ON c.customer_id = b.customer_id
JOIN payment p ON b.booking_id = p.booking_id;
3. Customers who gave a rating of 3 or below
sql
SELECT c.first_name, c.last_name, r.rating
FROM customer c
LEFT JOIN review r ON c.customer_id = r.customer_id
WHERE r.rating <= 3;
4. Most expensive room (subquery)
sql
SELECT room_no, room_type, price_per_night
FROM room
WHERE price_per_night = (SELECT MAX(price_per_night) FROM room);
5. Customers who spent more than the average booking amount
sql
SELECT c.first_name, c.last_name, b.total_amount
FROM customer c
JOIN booking b ON c.customer_id = b.customer_id
WHERE b.total_amount > (SELECT AVG(total_amount) FROM booking);
6. Rank customers by booking amount (window function)
sql
SELECT c.first_name, c.last_name, b.total_amount,
       RANK() OVER (ORDER BY b.total_amount DESC) AS customer_rank
FROM customer c
JOIN booking b ON c.customer_id = b.customer_id;
7. Serial number for bookings by date
sql
SELECT booking_id, booking_date, total_amount,
       ROW_NUMBER() OVER (ORDER BY booking_date) AS serial_no
FROM booking;
👁 Views
View	Purpose
customer_booking_view	Complete booking report: customer, room, dates, and total amount
hotel_transaction_detail	Booking, payment, and rating details in one place
customer_review	Customer names with their ratings and comments
sql
SELECT * FROM customer_booking_view;
SELECT * FROM hotel_transaction_detail;
SELECT * FROM customer_review;
