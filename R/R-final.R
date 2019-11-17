
#### On Linux server:
library(DBI)
con <- dbConnect(odbc::odbc(), .connection_string = "Driver={ODBC Driver 17 for SQL Server};server=192.168.1.1;
database=COLLEGE;uid=dsuser02;
pwd=DSuser02!", timeout = 10)

#### On Windows:
library(DBI)
con <- dbConnect(odbc::odbc(), .connection_string = "DSN=COLLEGE;Trusted_Connection=yes;", timeout = 10)

## Get the whole table:
df <- dbReadTable(con, "Classrooms")

library(dplyr)

## Questions

##############
## Q1. Count the number of students on each department¶
##############


##############
## Q2. How many students have each course of the English department and the 
##     total number of students in the department?
##############


##############
## Q3. How many small (<22 students) and large (22+ students) classrooms are 
##     needed for the Science department?
##############


##############
## Q4. A feminist student claims that there are more male than female in the 
##     College. Justify if the argument is correct
##############


##############
## Q5. For which courses the percentage of male/female students is over 70%?
##############


##############
## Q6. For each department, how many students passed with a grades over 80?
##############


##############
## Q7. For each department, how many students passed with a grades under 60?
##############


##############
## Q8. Rate the teachers by their average student's grades (in descending order).
##############


##############
## Q9. Create a dataframe showing the courses, departments they are associated with, 
##     the teacher in each course, and the number of students enrolled in the course 
##     (for each course, department and teacher show the names).
##############


##############
## Q10. Create a dataframe showing the students, the number of courses they take, 
##      the average of the grades per class, and their overall average (for each student 
##      show the student name).
##############


