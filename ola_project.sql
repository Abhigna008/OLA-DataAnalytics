CREATE TABLE bookings (
    Date TEXT, Time TEXT, Booking_ID TEXT, Booking_Status TEXT, 
    Customer_ID TEXT, Vehicle_Type TEXT, Pickup_Location TEXT, 
    Drop_Location TEXT, V_TAT TEXT, C_TAT TEXT, 
    Canceled_Rides_by_Customer TEXT, Canceled_Rides_by_Driver TEXT, 
    Incomplete_Rides TEXT, Incomplete_Rides_Reason TEXT, 
    Booking_Value TEXT, Payment_Method TEXT, Ride_Distance TEXT, 
    Driver_Ratings TEXT, Customer_Rating TEXT
);

-- Step A: Fix the word 'null' if any were missed during import
UPDATE bookings 
SET 
    V_TAT = NULLIF(V_TAT, 'null'),
    C_TAT = NULLIF(C_TAT, 'null'),
    Booking_Value = NULLIF(Booking_Value, 'null'),
    Ride_Distance = NULLIF(Ride_Distance, 'null'),
    Driver_Ratings = NULLIF(Driver_Ratings, 'null'),
    Customer_Rating = NULLIF(Customer_Rating, 'null');

-- Step B: Change to proper data types
ALTER TABLE bookings 
ALTER COLUMN V_TAT TYPE INTEGER USING V_TAT::INTEGER,
ALTER COLUMN C_TAT TYPE INTEGER USING C_TAT::INTEGER,
ALTER COLUMN Booking_Value TYPE INTEGER USING Booking_Value::INTEGER,
ALTER COLUMN Ride_Distance TYPE INTEGER USING Ride_Distance::INTEGER,
ALTER COLUMN Driver_Ratings TYPE NUMERIC USING Driver_Ratings::NUMERIC,
ALTER COLUMN Customer_Rating TYPE NUMERIC USING Customer_Rating::NUMERIC,
ALTER COLUMN Date TYPE DATE USING Date::DATE,
ALTER COLUMN Time TYPE TIME USING Time::TIME;

-- 1. Retrieve all successful bookings:
Create View Successful_Bookings As
SELECT * FROM bookings
WHERE booking_status = 'Success';

SELECT * FROM Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
SELECT vehicle_type, AVG(ride_distance)
as avg_distance FROM bookings
GROUP BY 1;

SELECT * FROM ride_distance_for_each_vehicle;

--3. Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customers As
SELECT COUNT(*) FROM bookings
WHERE booking_status = 'cancelled by Customer';

SELECT * FROM cancelled_rides_by_customers;

--4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As
SELECT customer_iD, COUNT(booking_iD) as total_rides
FROM bookings
GROUP BY customer_iD
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM Top_5_Customers;

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(driver_ratings) as max_rating,
MIN(driver_ratings) as min_rating
FROM bookings WHERE vehicle_type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;

--7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

select * from UPI_Payment;

--8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

select * from AVG_Cust_Rating;

--9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

select * from total_successful_ride_value;

--10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

select * from Incomplete_Rides_Reason;