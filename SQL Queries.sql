--Total Harvested Quantity, Lost Quantity and Loss Rate per crop

SELECT Crop,
	SUM(Total_Volume_Harvested_MT) AS Harvest_MT,
	SUM(Total_Volume_Lost_MT) AS Lost_MT,
	SUM (Total_Volume_Lost_MT) * 100/ SUM(Total_Volume_Harvested_MT) AS Loss_Rate
FROM [nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Year BETWEEN 2010 and 2025
GROUP BY Crop
ORDER BY Loss_Rate DESC;

--National Financial Impact of Loss per Crop

SELECT Crop,
	SUM(Total_Volume_Harvested_MT) AS Harvest_MT,
	SUM(Total_Volume_Lost_MT) AS Lost_MT,
	SUM (Total_Volume_Lost_MT) *  AVG(Average_Local_Market_Price_NGN_MT) AS Financial_Impact
FROM [nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Year BETWEEN 2010 and 2025
GROUP BY Crop
ORDER BY Financial_Impact DESC;


--Harvest and Loss Records for Maize per State

SELECT Year, Crop, State, Total_Volume_Harvested_MT, Total_Volume_Lost_MT
FROM [nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Year BETWEEN 2010 and 2025 and crop = 'Maize'
GROUP BY Year, Crop, State, Total_Volume_Harvested_MT, Total_Volume_Lost_MT
ORDER BY State, Total_Volume_Harvested_MT DESC;


--Harvest and Loss Records for Sorghum per State

SELECT Year, Crop, State, Total_Volume_Harvested_MT, Total_Volume_Lost_MT
FROM [nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Year BETWEEN 2010 and 2025 and crop = 'Sorghum'
GROUP BY Year, Crop, State, Total_Volume_Harvested_MT, Total_Volume_Lost_MT
ORDER BY State, Total_Volume_Harvested_MT DESC;


--Harvest and Loss Records for Rice per State

SELECT Year, Crop, State, Total_Volume_Harvested_MT, Total_Volume_Lost_MT
FROM [nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Year BETWEEN 2010 and 2025 and crop = 'Rice'
GROUP BY Year, Crop, State, Total_Volume_Harvested_MT, Total_Volume_Lost_MT
ORDER BY State, Total_Volume_Harvested_MT DESC;


--Crop loss records across the four supply chain stages 

SELECT Crop,
	SUM(Total_Volume_Harvested_MT) AS Harvest_MT,
	SUM(Total_Volume_Lost_MT) AS Lost_MT,
	SUM(Harvesting_Field_Drying_Loss_MT) AS HFD_Loss,
	SUM(Threshing_Cleaning_Loss_MT) AS T_C_Loss,
	SUM(Transportation_Loss_MT) AS Transport_Loss,
	SUM(Storage_Loss_MT) AS Storage_Loss
FROM [nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Year BETWEEN 2010 and 2025
GROUP BY Crop
ORDER BY Harvest_MT DESC;


--Crop Loss Rate across supply chain stages

SELECT Crop,
	SUM(Total_Volume_Lost_MT) AS Lost_MT,
	SUM (Harvesting_Field_Drying_Loss_MT) * 100/ SUM(Total_Volume_Lost_MT) AS HFD_Loss_Rate,
	SUM (Threshing_Cleaning_Loss_MT) * 100/ SUM(Total_Volume_Lost_MT) AS T_C_Loss_Rate,
	SUM (Transportation_Loss_MT) * 100/ SUM(Total_Volume_Lost_MT) AS Transport_Loss_Rate,
	SUM (Storage_Loss_MT) * 100/ SUM(Total_Volume_Lost_MT) AS Storage_Loss_Rate
FROM [nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Year BETWEEN 2010 and 2025
GROUP BY Crop
ORDER BY Lost_MT DESC;


--Create Regions table

CREATE table Regions
	(State nvarchar (50),
	Region nvarchar (50));



--Fill in values into the Regions table

INSERT into Regions
	VALUES ('FCT', 'North_Central'),
			('Benue', 'North_Central'),
			('Kogi', 'North_Central'),
			('Kwara', 'North_Central'),
			('Nasarawa', 'North_Central'),
			('Niger', 'North_Central'),
			('Plateau', 'North_Central'),
			('Adamawa', 'North_East'),
			('Bauchi', 'North_East'),
			('Borno', 'North_East'),
			('Gombe', 'North_East'),
			('Taraba', 'North_East'),
			('Yobe', 'North_East'),
			('Jigawa', 'North_West'),
			('Kaduna', 'North_West'),
			('Kano', 'North_West'),
			('Katsina', 'North_West'),
			('Kebbi', 'North_West'),
			('Sokoto', 'North_West'),
			('Zamfara', 'North_West'),
			('Abia', 'South_East'),
			('Anambra', 'South_East'),
			('Ebonyi', 'South_East'),
			('Enugu', 'South_East'),
			('Imo', 'South_East'),
			('Akwa Ibom', 'South_South'),
			('Bayelsa', 'South_South'),
			('Cross River', 'South_South'),
			('Delta', 'South_South'),
			('Edo', 'South_South'),
			('Rivers', 'South_South'),
			('Ogun', 'South_West'),
			('Ondo', 'South_West'),
			('Oyo', 'South_West'),
			('Ekiti', 'South_West'),
			('Lagos', 'South_West'),
			('Osun', 'South_West');

	
--Regional harvest, loss rate and loss volume across supply chain stages
	
SELECT b.Region,
	SUM(a.Total_Volume_Harvested_MT) AS Harvest_MT,
	SUM(a.Total_Volume_Lost_MT) AS Lost_MT,
	SUM(a.Total_Volume_Lost_MT) * 100/ SUM(a.Total_Volume_Harvested_MT) AS Loss_Rate,
	SUM(a.Harvesting_Field_Drying_Loss_MT) AS HFD_Loss,
	SUM(a.Storage_Loss_MT) AS Storage_Loss,
	SUM(a.Threshing_Cleaning_Loss_MT) AS T_C_Loss,
	SUM(a.Transportation_Loss_MT) AS Transport_Loss
FROM [nigeria_crop_comprehensive_metrics_2010_2025] a
full outer join Regions b on a.State = b.State
WHERE Year BETWEEN 2010 and 2025
GROUP BY b.Region
ORDER BY Loss_Rate DESC;


--Maize Regional harvest, loss rate and loss volume across supply chain stages

SELECT b.Region,
	SUM(a.Total_Volume_Harvested_MT) AS Harvest_MT,
	SUM(a.Total_Volume_Lost_MT) AS Lost_MT,
	SUM(a.Total_Volume_Lost_MT) * 100/ SUM(a.Total_Volume_Harvested_MT) AS Loss_Rate,
	SUM(a.Harvesting_Field_Drying_Loss_MT) AS HFD_Loss,
	SUM(a.Storage_Loss_MT) AS Storage_Loss,
	SUM(a.Threshing_Cleaning_Loss_MT) AS T_C_Loss,
	SUM(a.Transportation_Loss_MT) AS Transport_Loss
FROM [nigeria_crop_comprehensive_metrics_2010_2025] a
full outer join Regions b on a.State = b.State
WHERE Year BETWEEN 2010 and 2025
	and Crop = 'Maize'
GROUP BY b.Region
ORDER BY Loss_Rate DESC;

--Rice Regional harvest, loss rate and loss volume across supply chain stages

SELECT b.Region,
	SUM(a.Total_Volume_Harvested_MT) AS Harvest_MT,
	SUM(a.Total_Volume_Lost_MT) AS Lost_MT,
	SUM(a.Total_Volume_Lost_MT) * 100/ SUM(a.Total_Volume_Harvested_MT) AS Loss_Rate,
	SUM(a.Harvesting_Field_Drying_Loss_MT) AS HFD_Loss,
	SUM(a.Storage_Loss_MT) AS Storage_Loss,
	SUM(a.Threshing_Cleaning_Loss_MT) AS T_C_Loss,
	SUM(a.Transportation_Loss_MT) AS Transport_Loss
FROM [nigeria_crop_comprehensive_metrics_2010_2025] a
full outer join Regions b on a.State = b.State
WHERE Year BETWEEN 2010 and 2025
	and Crop = 'Rice'
GROUP BY b.Region
ORDER BY Loss_Rate DESC;

--Sorghum Regional harvest, loss rate and loss volume across supply chain stages

SELECT b.Region,
	SUM(a.Total_Volume_Harvested_MT) AS Harvest_MT,
	SUM(a.Total_Volume_Lost_MT) AS Lost_MT,
	SUM(a.Total_Volume_Lost_MT) * 100/ SUM(a.Total_Volume_Harvested_MT) AS Loss_Rate,
	SUM(a.Harvesting_Field_Drying_Loss_MT) AS HFD_Loss,
	SUM(a.Storage_Loss_MT) AS Storage_Loss,
	SUM(a.Threshing_Cleaning_Loss_MT) AS T_C_Loss,
	SUM(a.Transportation_Loss_MT) AS Transport_Loss
FROM [nigeria_crop_comprehensive_metrics_2010_2025] a
full outer join Regions b on a.State = b.State
WHERE Year BETWEEN 2010 and 2025
	and Crop = 'Sorghum'
GROUP BY b.Region
ORDER BY Loss_Rate DESC;


--Regional Financial Impact of Crop Loss

SELECT b.Region,
	SUM(a.Total_Volume_Harvested_MT) AS Harvest_MT,
	SUM(a.Total_Volume_Lost_MT) AS Lost_MT,
	SUM (a.Total_Volume_Lost_MT) *  AVG(a.Average_Local_Market_Price_NGN_MT) AS Financial_Impact
FROM [nigeria_crop_comprehensive_metrics_2010_2025] a
full outer join Regions b on a.State = b.State
WHERE Year BETWEEN 2010 and 2025
GROUP BY b.Region
ORDER BY Financial_Impact DESC;

