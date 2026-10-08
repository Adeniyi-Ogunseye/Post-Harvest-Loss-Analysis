--Harvesting_Field_Drying Loss for Maize year 2010

SELECT SUM (Harvesting_Field_Drying_Loss_MT) AS HFD_Loss,
Total_Volume_Lost_MT, Total_Volume_Harvested_MT, Threshing_Cleaning_Loss_MT,
Transportation_Loss_MT, Storage_Loss_MT, State, Crop, Year
FROM [RAW nigeria_crop_comprehensive_metrics_2010_2025]
WHERE YEAR = '2010'
GROUP BY Total_Volume_Lost_MT, Total_Volume_Harvested_MT, Threshing_Cleaning_Loss_MT,
Transportation_Loss_MT, Storage_Loss_MT, State, Crop, Year
HAVING Crop = 'MAIZE'
ORDER BY HFD_Loss DESC;

--Harvesting_Field_Drying Loss for Sorghum year 2010

SELECT SUM (Harvesting_Field_Drying_Loss_MT) AS HFD_Loss,
Total_Volume_Lost_MT, Total_Volume_Harvested_MT, Threshing_Cleaning_Loss_MT,
Transportation_Loss_MT, Storage_Loss_MT, State, Crop, Year
FROM [RAW nigeria_crop_comprehensive_metrics_2010_2025]
WHERE YEAR = '2010'
GROUP BY Total_Volume_Lost_MT, Total_Volume_Harvested_MT, Threshing_Cleaning_Loss_MT,
Transportation_Loss_MT, Storage_Loss_MT, State, Crop, Year
HAVING Crop = 'SORGHUM'
ORDER BY HFD_Loss DESC;

--Harvesting_Field_Drying Loss for Rice year 2010

SELECT SUM (Harvesting_Field_Drying_Loss_MT) AS HFD_Loss,
Total_Volume_Lost_MT, Total_Volume_Harvested_MT, Threshing_Cleaning_Loss_MT,
Transportation_Loss_MT, Storage_Loss_MT, State, Crop, Year
FROM [RAW nigeria_crop_comprehensive_metrics_2010_2025]
WHERE YEAR = '2010'
GROUP BY Total_Volume_Lost_MT, Total_Volume_Harvested_MT, Threshing_Cleaning_Loss_MT,
Transportation_Loss_MT, Storage_Loss_MT, State, Crop, Year
HAVING Crop = 'RICE'
ORDER BY HFD_Loss DESC;
