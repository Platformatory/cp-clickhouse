CREATE TABLE household_power_consumption (
    readingDate Date,
    readingTime String,
    global_active_power Float32,
    global_reactive_power Float32,
    voltage Float32,
    global_intensity Float32,
    sub_metering_1 Float32,
    sub_metering_2 Float32,
    sub_metering_3 Float32
) ENGINE = MergeTree()
ORDER BY (readingDate, readingTime);

SELECT count(*) from household_power_consumption;

-- Average Voltage Over Time
SELECT 
    readingDate,
    AVG(voltage) AS AvgVoltage
FROM household_power_consumption
GROUP BY readingDate
ORDER BY readingDate ASC;


-- Maximum and Minimum Global Active Power
SELECT
    MAX(global_active_power) AS MaxPower,
    MIN(global_active_power) AS MinPower
FROM household_power_consumption

-- Total Global Intensity by Date
SELECT
    readingDate,
    SUM(global_intensity) as TotalIntensity
FROM household_power_consumption
GROUP BY readingDate
ORDER BY readingDate ASC