SELECT 
    Outlet_Location_Type,

    ROUND(SUM(CASE 
        WHEN Item_Fat_Content = 'Low Fat' 
        THEN Total_Sales 
        ELSE 0 
    END), 2) AS Low_Fat,

    ROUND(SUM(CASE 
        WHEN Item_Fat_Content = 'Regular' 
        THEN Total_Sales 
        ELSE 0 
    END), 2) AS Regular

FROM blinkit_data

GROUP BY Outlet_Location_Type

ORDER BY Outlet_Location_Type;

SELECT Outlet_Establishment_Year,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
COUNT(*) AS No_Of_Items,
CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ASC;


SELECT 
    Outlet_Size, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


SELECT Outlet_Location_Type,
 CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
 CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
COUNT(*) AS No_Of_Items,
CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit_data
WHERE Outlet_Establishment_Year =2020 
GROUP BY Outlet_Location_Type
ORDER BY Total_sales DESC;

SELECT Outlet_Type,
 CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
 CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
COUNT(*) AS No_Of_Items,
CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_sales DESC;