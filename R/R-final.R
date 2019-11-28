
#### On Linux server:
library(DBI)
con <- dbConnect(odbc::odbc(), .connection_string = "Driver={ODBC Driver 17 for SQL Server};server=192.168.1.1;
database=COLLEGE;uid=dsuser02;
pwd=DSuser02!", timeout = 10)

#### On Windows:
library(DBI)
con <- dbConnect(odbc::odbc(), .connection_string = "DSN=COLLEGE;Trusted_Connection=yes;", timeout = 10)
courses <- dbGetQuery(con,"SELECT * FROM COLLEGE.dbo.Courses$") 
classrooms <- dbGetQuery(con,"SELECT * FROM COLLEGE.dbo.Classrooms$")
departments <- dbGetQuery(con,"SELECT * FROM COLLEGE.dbo.Departments$")
students <- dbGetQuery(con,"SELECT * FROM COLLEGE.dbo.Students$")
teachers <- dbGetQuery(con,"SELECT * FROM COLLEGE.dbo.Teachers$")

df <- merge(courses,classrooms,by= "CourseId")
df1 <- merge(df,students,by="StudentId")
df2 <- merge(df1,teachers,by="TeacherId")
names(departments)[1]<-"DepartmentID"
df3 <- merge(df2,departments,by="DepartmentID")

## Get the whole table:
df <- dbReadTable(con, "Classrooms")

library(dplyr)

## Questions

##############
## Q1. Count the number of students on each department¶
##############


df3 %>%
  select(DepartmentID, StudentId, DepartmentName) %>% distinct() %>%
  group_by(DepartmentName ) %>% summarise(count=n())



##############
## Q2. How many students have each course of the English department and the 
##     total number of students in the department?
##############
df3 %>% 
  filter(DepartmentID == 1) %>%
  select(DepartmentID, CourseName , StudentId,DepartmentName) %>% 
  group_by(CourseName ) %>% summarise(count=n_distinct(StudentId))

df3 %>% 
  filter(DepartmentID == 1) %>%
  select(DepartmentID, CourseName , StudentId,DepartmentName) %>% 
  group_by(DepartmentName ) %>% summarise(count=n_distinct(StudentId))

##############
## Q3. How many small (<22 students) and large (22+ students) classrooms are 
##     needed for the Science department?
##############




##############
## Q4. A feminist student claims that there are more male than female in the 
##     College. Justify if the argument is correct
##############

students %>%
  group_by(Gender) %>% summarise(count=n())
  
##############
## Q5. For which courses the percentage of male/female students is over 70%?
##############

df3 %>%
  select(CourseName,Gender.x)%>%
  mutate(male = ifelse(Gender.x == 'M',1,0)) %>%
  group_by(CourseName) %>%
  summarise(male = sum(male)/n() * 100) %>%
  filter(male>=70)
 
  df3 %>%
  select(CourseName,Gender.x)%>% 
  mutate(female = ifelse(Gender.x == 'F',1,0)) %>%
  group_by(CourseName) %>%
  summarise(female = sum(female)/n() * 100) %>%
  filter(female>=70)
            

##############
## Q6. For each department, how many students passed with a grades over 80?
##############
  df3 %>%
    select(DepartmentID,degree,StudentId)%>% 
    filter(degree>=80)%>%
    group_by(DepartmentID) %>%
     summarise(count=n_distinct(StudentId))
   

##############
## Q7. For each department, how many students passed with a grades under 60?
##############
  df3 %>%
    select(DepartmentID,degree,StudentId)%>% 
    filter(degree<=60)%>%
    group_by(DepartmentID) %>%
    summarise(count=n_distinct(StudentId))


##############
## Q8. Rate the teachers by their average student's grades (in descending order).
##############
df3 %>%
  select(TeacherId,degree) %>%
  group_by(TeacherId) %>% summarise(degree=mean(degree)) %>%
  arrange(desc(degree))

##############
## Q9. Create a dataframe showing the courses, departments they are associated with, 
##     the teacher in each course, and the number of students enrolled in the course 
##     (for each course, department and teacher show the names).
##############
df4 <- df3 %>%
    select(CourseName,DepartmentName,FirstName.y,LastName.y,StudentId)  %>%
  group_by(CourseName,DepartmentName,FirstName.y,LastName.y)  %>%
    summarise(count=n_distinct(StudentId))
  df4
  

##############
## Q10. Create a dataframe showing the students, the number of courses they take, 
##      the average of the grades per class, and their overall average (for each student 
##      show the student name).
##############


