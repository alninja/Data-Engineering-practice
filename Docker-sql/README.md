# Question 1. Understanding Docker images

```bash
docker run -it --rm python:3.13 bash
pip --version
```
The pip version is 25.3

# Question 2. Understanding Docker networking and docker-compose

db:5432

# Question 3. Counting short tips

```sql
    SELECT
        COUNT(1)
    FROM 
        green_taxi_2025
    WHERE
        lpep_pickup_datetime BETWEEN '2025-11-01' AND '2025-12-01'
        AND trip_distance <= 1;
```
- 8,007

# Question 4. Longest trip for each day 

```sql
    SELECT 
        lpep_pickup_datetime,  sum(trip_distance) AS trip_dist
    FROM 
        green_taxi_2025
    WHERE
        trip_distance < 100
    GROUP BY 
        1
    ORDER BY 
        trip_dist DESC;
```
- 2025-11-14


# Question 5. Biggest pickup zone on 2025-11-17

```sql
    SELECT
        zones."Zone", SUM(total_amount) AS TOTAL_REVENUE
    FROM 
        green_taxi_2025 JOIN zones ON 
        green_taxi_2025."PULocationID" = zones."LocationID"
    WHERE
        DATE(lpep_pickup_datetime) = '2025-11-18' 
    GROUP BY 1  
    ORDER BY TOTAL_REVENUE DESC;
```

-- East Harlem North 

# Question 6.Largest tip   

```sql
    SELECT
        dropoff_zone."Zone" AS Destination, 
        MAX(t.tip_amount) AS max_tip
    FROM 
        green_taxi_2025 t 
    JOIN zones pickup_zone 
        ON 	t."PULocationID" = pickup_zone."LocationID"
    JOIN zones dropoff_zone 
        ON 	t."DOLocationID" = dropoff_zone."LocationID"
    WHERE
        t.lpep_pickup_datetime between '2025-11-01' and '2025-12-01'
        AND 
            pickup_zone."Zone" = 'East Harlem North'
    GROUP BY 1
    ORDER BY max_tip DESC
    LIMIT 1;
```
-- Yorkville West

