select * FROM Wk1Employee
select * FROM Wk1Department

select * from Wk1Employee E
INNER JOIN Wk1Department D
On E.DepartmentID = D.DepartmentID

alter table wk1Employee
drop column departmentID 

select * from Wk1Employee order by LastName, FirstName

select * from wk1Employee where LastName = 'doe' 

select count (employeeID) from Wk1Employee 
Where Lastname = 'doe'
