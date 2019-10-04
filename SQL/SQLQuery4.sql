USE [COLLEGE]
GO



--2a
	
SELECT dbo.Departments$.DepartmentName, dbo.Courses$.DepartmentID ,COUNT(dbo.Students$.StudentId) 
AS NumberOfstudent FROM dbo.Departments$
INNER JOIN dbo.Courses$ ON dbo.Departments$.[DepartmentId] = dbo.Courses$.DepartmentID
INNER JOIN dbo.Students$ ON dbo.Courses$.CourseId = dbo.Students$.StudentId
GROUP BY dbo.Departments$.DepartmentName , dbo.Courses$.DepartmentID 

--2b.1

SELECT dbo.Courses$.CourseName , Count(dbo.Classrooms$.CourseId) 
AS N_students FROM dbo.Classrooms$  
INNER JOIN dbo.Courses$ ON dbo.Courses$.CourseId = dbo.Classrooms$.CourseId
WHERE dbo.Courses$.CourseName  IN (SELECT CourseName FROM dbo.Courses$ INNER JOIN [dbo].[Departments$] 
ON [dbo].[Departments$]. [DepartmentId] = [dbo].[Courses$]. [DepartmentID] WHERE [dbo].[Departments$].[DepartmentName] = 'ENGLISH')
GROUP  BY dbo.Courses$.CourseName

--2b.2

SELECT Count(DISTINCT( [dbo].[Classrooms$].StudentId)) AS sum_english_students
FROM  [dbo].[Classrooms$]
WHERE  [dbo].[Classrooms$].[CourseId] IN (SELECT [CourseId]
FROM  [dbo].[Courses$] INNER JOIN  [dbo].[Departments$]
ON [dbo].[Departments$].[DepartmentId] = [dbo].[Courses$].[DepartmentID]
WHERE [dbo].[Departments$].DepartmentName ='ENGLISH') 

--2c

SELECT CASE WHEN students_num > 22 THEN 'BIG' ELSE 'SMAL' END AS room_category,
count(*)
FROM (SELECT [dbo].[Courses$].CourseName , COUNT(*) AS students_num FROM [dbo].[Classrooms$]
INNER JOIN [dbo].[Courses$] ON [dbo].[Courses$].[CourseId] = [dbo].[Classrooms$].CourseId 
WHERE [dbo].[Classrooms$].CourseId IN (SELECT CourseId FROM [dbo].[Classrooms$]    
INNER JOIN [dbo].[Departments$] ON [dbo].[Departments$].[DepartmentID] = [dbo].[Courses$].DepartmentID
WHERE [DepartmentID] = 'SCIENCE')
GROUP BY [dbo].[Courses$].CourseName) AS NEW
GROUP BY ( CASE WHEN students_num > 22 THEN 'BIG' ELSE 'SMAL' END)
  
      
--2d 

SELECT [dbo].[Students$].[Gender], Count([dbo].[Students$].[Gender])
FROM  [dbo].[Students$]
GROUP BY [dbo].[Students$].[Gender]


--2e

SELECT [dbo].[Courses$].CourseName , [dbo].[Students$].Gender AVG 
FROM [dbo].[Students$] INNER JOIN [dbo].[Classrooms$] ON [dbo].[Courses$].[StudentId] = [dbo].[Classrooms$].[StudentId]
INNER JOIN [dbo].[Courses$] ON [dbo].[Courses$].CourseId = [dbo].[Classrooms$].CourseId






--2h

SELECT [dbo].[Courses$].[CourseName],[dbo].[Teachers$].[FirstName], AVG ([dbo].[Classrooms$].[degree] ) AS AVG_d
FROM [dbo].[Classrooms$] INNER JOIN [dbo].[Courses$] ON [dbo].[Courses$].[CourseId] = [dbo].[Classrooms$].[CourseId]
INNER JOIN [dbo].[Teachers$] ON [dbo].[Teachers$].[TeacherId] = [dbo].[Courses$].[TeacherId]
GROUP BY [dbo].[Courses$].[CourseName] ,[dbo].[Teachers$].[FirstName]
ORDER BY avg_d DESC 

--3.a

CREATE VIEW AS 

SELECT [dbo].[Courses$].CourseName , [dbo].[Departments$].DepartmentName ,[dbo].[Teachers$].[FirstName] , COUNT(*) num_stu
  FROM  [dbo].[Classrooms$] 
  INNER JOIN [dbo].[Courses$] ON [dbo].[Courses$].CourseId = [dbo].[Classrooms$].CourseId
  LEFT OUTER JOIN [dbo].[Departments$] ON [dbo].[Courses$].DepartmentID = [dbo].[Departments$].DepartmentId
  LEFT OUTER JOIN [dbo].[Teachers$] ON   [dbo].[Teachers$].TeacherId =  [dbo].[Courses$].TeacherId 
  GROUP BY [dbo].[Courses$].CourseName, [dbo].[Departments$].DepartmentName ,[dbo].[Teachers$].[FirstName]
  
  SELECT [dbo].[Courses$].CourseName , [dbo].[Departments$].DepartmentName ,[dbo].[Teachers$].[FirstName] , COUNT(*) num_stu
  FROM  [dbo].[Classrooms$] 
  INNER JOIN [dbo].[Courses$] ON [dbo].[Courses$].CourseId = [dbo].[Classrooms$].CourseId
  LEFT OUTER JOIN [dbo].[Departments$] ON [dbo].[Courses$].DepartmentID = [dbo].[Departments$].DepartmentId
  LEFT OUTER JOIN [dbo].[Teachers$] ON   [dbo].[Teachers$].TeacherId =  [dbo].[Courses$].TeacherId 
  GROUP BY [dbo].[Courses$].CourseName, [dbo].[Departments$].DepartmentName ,[dbo].[Teachers$].[FirstName]
      

                   


 