SELECT * FROM tblPaymentMethod

select * from tbljobposition

SELECT * FROM tblPaymentMethod
ORDER BY PaymentMethod

select top 5 * from tblProduct
ORDER BY productname

select top 5 percent *from tblproduct
order by productname 

SELECT ProductCode, ProductName, CurrentStandardUnitPrice
FROM tblProduct
ORDER BY CurrentStandardUnitPrice DESC, ProductName


Select companyId, CompanyName, DateLastModified 
From tblcompany 
order by datelastmodified desc, companyname 


SELECT ProductCode, ProductName, QuantityOnHand
FROM tblProduct
WHERE QuantityOnHand < 5
ORDER BY QuantityOnHand DESC, ProductName


Select companyId, CompanyName, IsCustomer
from tblcompany where iscustomer = 'n'
order by companyname


SELECT OrderNo, OrderDate, CompanyID
FROM tblCustomerOrder
WHERE OrderDate >= '10/1/2020' AND OrderDate <= '10/14/2020'
ORDER BY CompanyID, OrderDate DESC



select EmployeeId, JobpositionId, Username, UserPassword
from tblemployee
where username = 'dliu004' and userpassword = 'ism185avi'  

select paymentmethodID, Paymentmethod
from tblpaymentmethod
where paymentmethodid <= 3 or paymentmethodid = 5
order by paymentmethod

SELECT PaymentMethodID, PaymentMethod
FROM tblPaymentMethod
WHERE PaymentMethodID IN (1, 2, 3, 5)
ORDER BY PaymentMethod


SELECT PaymentMethodID, PaymentMethod
FROM tblPaymentMethod
WHERE PaymentMethodID not IN (1, 2, 3, 5)
ORDER BY PaymentMethod


SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullEmployeeName, JobPositionID
FROM tblEmployee
WHERE EmployeeID = 49



select productcode, CONCAT(ProductName, ': $ ', CurrentStandardUnitPrice, '. QoH: ', QuantityOnHand) as productname
from tblproduct



SELECT EmployeeID, CONCAT(LastName, ', ', FirstName) AS FullEmployeeName, SupervisorID
FROM tblEmployee
WHERE SupervisorID IS NULL
ORDER BY FullEmployeeName

