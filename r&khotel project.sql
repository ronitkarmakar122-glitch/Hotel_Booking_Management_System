create database RKHotel;
use rkhotel;

create table customer(
customer_id int primary key,
first_name varchar(20),
last_name varchar(20),
gender enum('male','female'),
email varchar(50) unique,
phone_no varchar(50));

desc customer;

create table room(
room_id INT PRIMARY KEY,
    room_no INT UNIQUE,
    room_type_id INT,
    room_status VARCHAR(20),
    capacity int,
price_per_night decimal(10,2),
 ac BOOLEAN);
 
desc room;

create table booking(
booking_id int primary key,
check_in_date date,
check_out_date date,
booking_date date,
total_amount decimal(10,2),
room_id int,
customer_id int,

foreign key(room_id) 
references room(room_id),
foreign key(customer_id) 
references customer(customer_id)
);

desc booking;

CREATE TABLE review (
    review_id INT PRIMARY KEY,
    booking_id INT,
    customer_id INT,
    rating INT,
    comment VARCHAR(255),

    FOREIGN KEY (booking_id)
    REFERENCES booking(booking_id),

    FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
);
desc review;
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),

    FOREIGN KEY (booking_id)
    REFERENCES booking(booking_id)
);
desc payment;


INSERT INTO customer
(customer_id, first_name, last_name, gender, email, phone_no)
VALUES
(1, 'Sanskar', 'Sharma', 'male', 'sanskar@gmail.com', '9876543210'),
(2, 'Raj', 'Patel', 'male', 'raj@gmail.com', '9876543211'),
(3, 'Vinay', 'Kumar', 'male', 'vinay@gmail.com', '9876543212'),
(4, 'Ansh', 'Gupta', 'male', 'ansh@gmail.com', '9876543213'),
(5, 'Aryan', 'Singh', 'male', 'aryan@gmail.com', '9876543214'),
(6, 'Danish', 'Khan', 'male', 'danish@gmail.com', '9876543215'),
(7, 'Prathamesh', 'Patil', 'male', 'prathamesh@gmail.com', '9876543216'),
(8, 'Ashutosh', 'Mishra', 'male', 'ashutosh@gmail.com', '9876543217'),
(9, 'Hardik', 'Joshi', 'male', 'hardik@gmail.com', '9876543218'),
(10, 'Shruti', 'Verma', 'female', 'shruti@gmail.com', '9876543219'),
(11, 'Aayush', 'Yadav', 'male', 'aayush@gmail.com', '9876543220'),
(12, 'Rohan', 'Mehta', 'male', 'rohan@gmail.com', '9876543221'),
(13, 'Neha', 'Shah', 'female', 'neha@gmail.com', '9876543222'),
(14, 'Karan', 'Malhotra', 'male', 'karan@gmail.com', '9876543223'),
(15, 'Priya', 'Nair', 'female', 'priya@gmail.com', '9876543224'),
(16, 'Aditya', 'Roy', 'male', 'aditya@gmail.com', '9876543225'),
(17, 'Sneha', 'Kulkarni', 'female', 'sneha@gmail.com', '9876543226'),
(18, 'Rahul', 'Chavan', 'male', 'rahul@gmail.com', '9876543227'),
(19, 'Pooja', 'Deshmukh', 'female', 'pooja@gmail.com', '9876543228'),
(20, 'Sahil', 'Jain', 'male', 'sahil@gmail.com', '9876543229'),
(21, 'Nikita', 'Rao', 'female', 'nikita@gmail.com', '9876543230'),
(22, 'Yash', 'Agrawal', 'male', 'yash@gmail.com', '9876543231'),
(23, 'Kalpak', 'Saxena', 'male', 'kalpak@gmail.com', '9876543232'),
(24, 'Abhishek', 'Tiwari', 'male', 'abhishek@gmail.com', '9876543233'),
(25, 'Ishita', 'Kapoor', 'female', 'ishita@gmail.com', '9876543234');

select*from customer;

alter table room 
rename column room_type_id to room_type;

alter table room
modify column room_type varchar(40);


INSERT INTO room
(room_id, room_no, room_type, room_status, capacity, price_per_night, ac)
VALUES
(1, 101, 'Single', 'Available', 1, 1800.00, TRUE),
(2, 102, 'Deluxe', 'Booked', 3, 4500.00, TRUE),
(3, 103, 'Double', 'Available', 2, 3200.00, FALSE),
(4, 104, 'Family', 'Booked', 5, 8500.00, TRUE),
(5, 105, 'Suite', 'Maintenance', 4, 7000.00, TRUE),
(6, 106, 'Single', 'Booked', 1, 2000.00, FALSE),
(7, 107, 'Deluxe', 'Available', 3, 4800.00, TRUE),
(8, 108, 'Double', 'Booked', 2, 3400.00, TRUE),
(9, 109, 'Family', 'Available', 5, 9000.00, TRUE),
(10, 110, 'Suite', 'Booked', 4, 7500.00, TRUE),
(11, 201, 'Single', 'Available', 1, 1900.00, FALSE),
(12, 202, 'Double', 'Booked', 2, 3300.00, TRUE),
(13, 203, 'Suite', 'Available', 4, 7200.00, TRUE),
(14, 204, 'Deluxe', 'Booked', 3, 4600.00, TRUE),
(15, 205, 'Family', 'Available', 5, 8700.00, FALSE),
(16, 206, 'Single', 'Maintenance', 1, 1750.00, TRUE),
(17, 207, 'Suite', 'Available', 4, 7800.00, TRUE),
(18, 208, 'Double', 'Booked', 2, 3100.00, FALSE),
(19, 209, 'Family', 'Available', 5, 9200.00, TRUE),
(20, 210, 'Deluxe', 'Booked', 3, 4900.00, TRUE),
(21, 301, 'Single', 'Available', 1, 2100.00, FALSE),
(22, 302, 'Double', 'Booked', 2, 3500.00, TRUE),
(23, 303, 'Deluxe', 'Available', 3, 4400.00, TRUE),
(24, 304, 'Suite', 'Maintenance', 4, 7300.00, TRUE),
(25, 305, 'Family', 'Booked', 5, 8800.00, TRUE);

select * from room;

INSERT INTO booking
(booking_id, check_in_date, check_out_date, booking_date, total_amount, room_id, customer_id)
VALUES
(1, '2026-07-01', '2026-07-03', '2026-06-28', 3600.00, 1, 5),
(2, '2026-07-02', '2026-07-05', '2026-06-29', 13500.00, 2, 1),
(3, '2026-07-04', '2026-07-06', '2026-07-01', 6400.00, 3, 8),
(4, '2026-07-05', '2026-07-08', '2026-07-02', 25500.00, 4, 3),
(5, '2026-07-06', '2026-07-07', '2026-07-03', 7000.00, 5, 12),
(6, '2026-07-08', '2026-07-10', '2026-07-05', 3600.00, 6, 7),
(7, '2026-07-09', '2026-07-12', '2026-07-06', 13500.00, 7, 15),
(8, '2026-07-10', '2026-07-13', '2026-07-07', 9600.00, 8, 10),
(9, '2026-07-11', '2026-07-14', '2026-07-08', 21000.00, 9, 2),
(10, '2026-07-12', '2026-07-15', '2026-07-09', 25500.00, 10, 9),
(11, '2026-07-13', '2026-07-15', '2026-07-10', 6400.00, 11, 4),
(12, '2026-07-14', '2026-07-16', '2026-07-11', 3600.00, 12, 11),
(13, '2026-07-15', '2026-07-18', '2026-07-12', 25500.00, 13, 18),
(14, '2026-07-16', '2026-07-18', '2026-07-13', 9000.00, 14, 6),
(15, '2026-07-17', '2026-07-20', '2026-07-14', 21000.00, 15, 13),
(16, '2026-07-18', '2026-07-19', '2026-07-15', 3200.00, 16, 20),
(17, '2026-07-19', '2026-07-22', '2026-07-16', 5400.00, 17, 14),
(18, '2026-07-20', '2026-07-23', '2026-07-17', 14400.00, 18, 17),
(19, '2026-07-21', '2026-07-24', '2026-07-18', 25500.00, 19, 16),
(20, '2026-07-22', '2026-07-24', '2026-07-19', 14000.00, 20, 19),
(21, '2026-07-23', '2026-07-25', '2026-07-20', 3600.00, 21, 21),
(22, '2026-07-24', '2026-07-27', '2026-07-21', 9900.00, 22, 22),
(23, '2026-07-25', '2026-07-28', '2026-07-22', 13500.00, 23, 23),
(24, '2026-07-26', '2026-07-29', '2026-07-23', 25500.00, 24, 24),
(25, '2026-07-27', '2026-07-30', '2026-07-24', 21000.00, 25, 25);
select* from booking;

INSERT INTO payment
(payment_id, booking_id, payment_date, amount, payment_method)
VALUES
(1, 1, '2026-06-28', 3600.00, 'UPI'),
(2, 2, '2026-06-29', 13500.00, 'Credit Card'),
(3, 3, '2026-07-01', 6400.00, 'Cash'),
(4, 4, '2026-07-02', 25500.00, 'Debit Card'),
(5, 5, '2026-07-03', 7000.00, 'UPI'),
(6, 6, '2026-07-05', 3600.00, 'Net Banking'),
(7, 7, '2026-07-06', 13500.00, 'Credit Card'),
(8, 8, '2026-07-07', 9600.00, 'Cash'),
(9, 9, '2026-07-08', 21000.00, 'UPI'),
(10, 10, '2026-07-09', 25500.00, 'Debit Card'),
(11, 11, '2026-07-10', 6400.00, 'Credit Card'),
(12, 12, '2026-07-11', 3600.00, 'UPI'),
(13, 13, '2026-07-12', 25500.00, 'Net Banking'),
(14, 14, '2026-07-13', 9000.00, 'Cash'),
(15, 15, '2026-07-14', 21000.00, 'Credit Card'),
(16, 16, '2026-07-15', 3200.00, 'UPI'),
(17, 17, '2026-07-16', 5400.00, 'Debit Card'),
(18, 18, '2026-07-17', 14400.00, 'Net Banking'),
(19, 19, '2026-07-18', 25500.00, 'Cash'),
(20, 20, '2026-07-19', 14000.00, 'UPI'),
(21, 21, '2026-07-20', 3600.00, 'Credit Card'),
(22, 22, '2026-07-21', 9900.00, 'Debit Card'),
(23, 23, '2026-07-22', 13500.00, 'Cash'),
(24, 24, '2026-07-23', 25500.00, 'Net Banking'),
(25, 25, '2026-07-24', 21000.00, 'UPI');
select* from payment;

INSERT INTO review
(review_id, booking_id, customer_id, rating, comment)
VALUES
(1, 1, 5, 5, 'Excellent stay and friendly staff.'),
(2, 2, 1, 4, 'Clean room and good service.'),
(3, 3, 8, 5, 'Loved the room and food.'),
(4, 4, 3, 3, 'Good experience but a bit expensive.'),
(5, 5, 12, 4, 'Comfortable stay.'),
(6, 6, 7, 5, 'Amazing hospitality.'),
(7, 7, 15, 4, 'Room was neat and spacious.'),
(8, 8, 10, 3, 'Service was average.'),
(9, 9, 2, 5, 'Highly recommended.'),
(10, 10, 9, 4, 'Very peaceful environment.'),
(11, 11, 4, 5, 'Everything was perfect.'),
(12, 12, 11, 2, 'Room cleaning could improve.'),
(13, 13, 18, 5, 'Fantastic stay with family.'),
(14, 14, 6, 4, 'Nice hotel and polite staff.'),
(15, 15, 13, 3, 'Food was okay, room was good.'),
(16, 16, 20, 4, 'Worth the money.'),
(17, 17, 14, 5, 'Will definitely visit again.'),
(18, 18, 17, 4, 'Good location and clean rooms.'),
(19, 19, 16, 5, 'Excellent facilities.'),
(20, 20, 19, 3, 'Check-in took longer than expected.'),
(21, 21, 21, 4, 'Nice experience overall.'),
(22, 22, 22, 5, 'Loved the Deluxe room.'),
(23, 23, 23, 4, 'Comfortable beds and clean washroom.'),
(24, 24, 24, 5, 'One of the best hotel stays.'),
(25, 25, 25, 4, 'Good value for money.');

select* from review;

-- joins
-- Display each customer's name along with their room number and check-in/check-out dates.

SELECT
    c.first_name,
    c.last_name,
    r.room_no,
    b.check_in_date,
    b.check_out_date
FROM customer c
JOIN booking b
ON c.customer_id = b.customer_id
JOIN room r
ON b.room_id = r.room_id;

-- Display the customer name, payment amount, payment method, and payment date for all bookings/Payment Report
-- mine own query
select b.booking_id,c.first_name,c.last_name,p.amount as payment_amount,p.payment_method,p.payment_date
from customer c join booking b
on c.customer_id=b.customer_id
join payment p
on b.booking_id=p.booking_id;
-- clear and cleaner query
SELECT
    c.first_name,
    c.last_name,
    p.amount AS payment_amount,
    p.payment_method,
    p.payment_date
FROM customer c
JOIN booking b
ON c.customer_id = b.customer_id
JOIN payment p
ON b.booking_id = p.booking_id;


-- Display customer names along with their room status (Available, Booked, etc.).
select c.first_name,c.last_name,r.room_status
FROM CUSTOMER C JOIN BOOKING B
on c.customer_id=b.customer_id
join room r
on r.room_id=b.room_id;
-- ***
-- Show customers who gave ratings below or equal to 3
select c.first_name,c.last_name,r.rating
from customer c  left join review r
on c.customer_id=r.customer_id
where r.rating<=3;


-- Hotel Transaction Report **** 
select c.first_name,c.last_name,r.room_no,p.amount AS payment_amount,
    p.payment_method , p.payment_date
   FROM CUSTOMER C  JOIN BOOKING B
on c.customer_id=b.customer_id
join room r
on r.room_id=b.room_id
join payment p
on p.booking_id=b.booking_id;

-- Complete Booking Report ***
select b.booking_id,c.first_name,c.last_name,r.room_no,
r.room_type,b.check_in_date,b.check_out_date,b.total_amount
from booking b join customer c
on b.customer_id=c.customer_id
join room r
on r.room_id=b.room_id;

-- Display all rooms, even if they have never been booked.
SELECT
    r.room_no,
    r.room_type,
    r.room_status,
    c.first_name,
    c.last_name
FROM room r
LEFT JOIN booking b
ON r.room_id = b.room_id
LEFT JOIN customer c
ON b.customer_id = c.customer_id;


-- Generate a report of all confirmed bookings, including customer details, room information, and total charges.
select b.booking_id,c.last_name,c.first_name,r.room_status,p.amount
from customer c
join booking b
on c.customer_id=b.customer_id
join room r
on r.room_id=b.room_id
join payment p
on p.booking_id=b.booking_id
where room_status='booked';

-- Display the customer details along with their ratings and review comments.
select c.first_name,c.last_name,
r.rating,r.comment as review
from customer c join review r
on c.customer_id=r.customer_id;


-- -----------------------------------------------------------  
-- subquers
-- display most expensive room

use rkhotel;
SELECT
    room_no,
    room_type,
    price_per_night
FROM room
WHERE price_per_night = (
    SELECT MAX(price_per_night)
    FROM room
);

-- mine query
select room_no,room_type,Price_per_night
from room where Price_per_night=(
select max(price_per_night) from room);

select max(amount) from payment;

-- cust who spent more than average amount
select c.first_name,c.last_name,b.total_amount
from customer c join booking b 
on c.customer_id=b.customer_id 
where b.total_amount> 
(select avg(total_amount) from booking);

-- 
SELECT c.first_name,c.last_name,r.rating
FROM customer c join review r
on c.customer_id=r.customer_id
where r.rating in (
    select customer_id
    from booking
    WHERE booking_id IN (
        SELECT booking_id
        FROM review
        WHERE rating = (
            SELECT MAX(rating)
            FROM review
        )
    )
);
-- cust with high ratings
select c.first_name,c.last_name,r.rating
from customer c join review r
on c.customer_id=r.customer_id
where r.rating in (
    select customer_id
    from booking
    where booking_id IN (
	select booking_id from review where rating = 
    (select MAX(rating)from review)));
    
    select
    c.first_name,
    c.last_name,
    b.total_amount
from customer c
join  booking b
ON c.customer_id = b.customer_id
where b.total_amount > any (
    select total_amount
    from booking
    where room_id in (
        select room_id
        from room
        where room_type = 'Deluxe'
    )
);
    
-- window func

SELECT
    c.first_name,
    c.last_name,
    b.total_amount,
    RANK() OVER (ORDER BY b.total_amount DESC) AS customer_rank
FROM customer c
JOIN booking b
ON c.customer_id = b.customer_id;
USE RKHOTEL;
SELECT
    booking_id,
    booking_date,
    total_amount,
    ROW_NUMBER() OVER (ORDER BY booking_date) AS serial_no
FROM booking;

SELECT
    c.first_name,
    c.last_name,
    b.total_amount,
    dense_RANK() OVER (ORDER BY b.total_amount DESC) AS customer_rank
FROM customer c
JOIN booking b
ON c.customer_id = b.customer_id;




-- views
CREATE VIEW customer_booking_view AS
SELECT
    b.booking_id,
    c.first_name,
    c.last_name,
    r.room_no,
    r.room_type,
    b.check_in_date,
    b.check_out_date,
    b.total_amount
FROM booking b
JOIN customer c
ON b.customer_id = c.customer_id
JOIN room r
ON b.room_id = r.room_id;

select * from customer_booking_view;

CREATE VIEW hotel_transaction_detail AS
SELECT
    b.booking_id,
    c.first_name,
    c.last_name,
    r.room_no,
    p.amount,
    p.payment_method,
    rv.rating
FROM booking b
JOIN customer c
ON b.customer_id = c.customer_id
JOIN room r
ON b.room_id = r.room_id
JOIN payment p
ON b.booking_id = p.booking_id
LEFT JOIN review rv
ON b.booking_id = rv.booking_id;

select * from hotel_transaction_detail;

CREATE VIEW customer_review AS
SELECT
    c.first_name,
    c.last_name,
    rv.rating,
    rv.comment
FROM customer c
JOIN review rv
ON c.customer_id = rv.customer_id;

select * from customer_review;










