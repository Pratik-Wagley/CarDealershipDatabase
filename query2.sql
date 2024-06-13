SELECT v.VIN, v.make, v.model, v.year, v.color, v.price, v.sold
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 1;