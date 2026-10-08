--Harvest and Post-Harvest-Loss Records 
--of the top 10 Maize producing state in year 2010

SELECT TOP 10 SUM (Total_Volume_Harvested_MT) AS TOTAL_HARVEST, 
Total_Volume_Lost_MT, State, Crop, Year
FROM [RAW nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Year = '2010'
GROUP BY State, Crop, Year, Total_Volume_Lost_MT 
HAVING Crop = 'MAIZE'
ORDER BY TOTAL_HARVEST DESC;

--Harvest and Post-Harvest-Loss records 
--of the top 10 Sorghum producing state in year 2010

SELECT TOP 10 SUM (Total_Volume_Harvested_MT) AS TOTAL_HARVEST, 
Total_Volume_Lost_MT, State, Crop, Year
FROM [RAW nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Crop = 'Sorghum'
GROUP BY State, Crop, Year, Total_Volume_Lost_MT
HAVING Year = '2010'
ORDER BY TOTAL_HARVEST DESC;

--Harvest and Post-Harvest-Loss recods
--of top 10 Rice producing state in 2010

SELECT TOP 10 SUM (Total_Volume_Harvested_MT) AS TOTAL_HARVEST,
Total_Volume_Lost_MT, State, Crop, Year
FROM [RAW nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Crop = 'Rice'
GROUP BY State, Crop, Year, Total_Volume_Lost_MT
HAVING Year = '2010'
ORDER BY TOTAL_HARVEST DESC;

--Harvest and Post-Harvest-Loss Records 
--of bottom 10 Maize producing state in year 2010

SELECT TOP 10 SUM (Total_Volume_Harvested_MT) AS TOTAL_HARVEST, 
Total_Volume_Lost_MT, State, Crop, Year
FROM [RAW nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Year = '2010'
GROUP BY State, Crop, Year, Total_Volume_Lost_MT
HAVING Crop = 'MAIZE'
ORDER BY TOTAL_HARVEST;

--Harvest and Post-Harvest-Loss records
--of bottom 10 Sorghum producing state in year 2010

SELECT TOP 10 SUM (Total_Volume_Harvested_MT) AS TOTAL_HARVEST, 
Total_Volume_Lost_MT, State, Crop, Year
FROM [RAW nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Crop = 'Sorghum'
GROUP BY State, Crop, Year, Total_Volume_Lost_MT
HAVING Year = '2010'
ORDER BY TOTAL_HARVEST;

--Harvest and Post-Harvest-Loss records
--of bottom 10 Rice producing state in 2010

SELECT TOP 10 SUM (Total_Volume_Harvested_MT) AS TOTAL_HARVEST,
Total_Volume_Lost_MT, State, Crop, Year
FROM [RAW nigeria_crop_comprehensive_metrics_2010_2025]
WHERE Crop = 'Rice'
GROUP BY State, Crop, Year, Total_Volume_Lost_MT
HAVING Year = '2010'
ORDER BY TOTAL_HARVEST;


