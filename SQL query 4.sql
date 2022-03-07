SELECT O.OrderNo, O.OrderDate, OL.OrderLineID, OL.ProductCode,  
P.ProductName, P.UnitPrice, OL.QuantityOrdered, 
P.UnitPrice*OL.QuantityOrdered AS Total
FROM Wk3CustomerOrder O INNER JOIN Wk3OrderLine OL 
ON O.OrderNo = OL.OrderNo INNER JOIN Wk3PRoduct P
ON OL.ProductCode = P.ProductCode
WHERE O.OrderNo =1 -- Show only Order 1
ORDER BY O.OrderNo, OL.ProductCode
-- this is how you write a comment 



SELECT * FROM Wk3Product
UPDATE Wk3Product SET
UnitPrice = 6.00
WHERE ProductCode = 1
SELECT * FROM Wk3Product
