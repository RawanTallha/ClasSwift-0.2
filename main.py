class User:
  def __init__(self, name, phoneNumber, email, department):
    self.name = name
    self.phoneNumber = phoneNumber
    self.email = email
    self.department = department

  def __str__(self):
    return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\ndepartment: {self.department}" 

class FacultyMember (User):
    def __init__(self,name, phoneNumber, email, department, facultyID):
        super().__init__(name, phoneNumber, email, department)
        self.facultyID = facultyID
              
    def __str__(self):
        return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\ndepartment: {self.department}\nfaculty ID: {self.facultyID}"      


class Maintenance(User):
    def __init__(self, name, phoneNumber, email, department, maintenanceId):
        super().__init__(name, phoneNumber, email, department)
        self.maintenanceId = maintenanceId
    

    def __str__(self):
        return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\ndepartment: {self.department}\nmaintenanceId: {self.maintenanceId}"

class Student(User):
    def __init__(self, name, phoneNumber, email, department, studentID, major):
        super().__init__(name, phoneNumber, email, department)
        self.studentID = studentID
        self.major = major
        
    def __str__(self):
        return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\ndepartment: {self.department}\nstudent ID: {self.studentID}\nmajor: {self.major}"
    
    
class Building:
    def __init__(self, buildingNo, location, numOfFloors, numOfClassrooms, capacity, accesible):
        self.buildingNo = buildingNo
        self.location = location 
        self.numOfFloors = numOfFloors
        self.numOfClassrooms = numOfClassrooms
        self.capacity = capacity
        self.accesible = accesible
        self.classrooms = []
        
    def add_classroom(self, Classroom):
        self.classrooms.append(Classroom)   
        
    def display_classrooms(self):
        print(f"classrooms in {self.buildingNo} are: \n")
        for classroom in self.classrooms:
            print(f"{classroom}\n")
            
    def find_alternative(self, FacultyMember): # for faculty functionality
        print(f"hello {FacultyMember.name} the available classrooms are: ")
        for classroom in self.classrooms:
            if classroom.isAvailable == True:
                print(classroom.display_classroom_num())
        picked = input("please type the number of the picked classroom: ")
        for classroom in self.classrooms:
            if classroom.isAvailable == True and str(classroom.classroomNo) in str(picked) :
                classroom.isAvailable = False
                print(f"classroom number: {classroom.classroomNo} is now booked\nthank you {FacultyMember.name}!")
                return
        print("The class you have chosen is not available!")
        
    def view_available(self, Student): # for student functionality 
        print(f"hello {Student.name} the available classrooms are:")
        for classroom in self.classrooms:
            if classroom.isAvailable == True:
                print(classroom.__str__())
                print("\n")
        
            
    def __str__(self):
        return f"building number: {self.buildingNo}\nlocation: {self.location}\nnumebr of floors: {self.numOfFloors}\nnumber of classrooms: {self.numOfClassrooms}\ncapacity: {self.capacity}\naccesible?: {self.accesible}"
    
class Classroom:
    
    def __init__(self, classroomNo, floor, capacity, isAvailable, isALab):
        self.classroomNo = classroomNo
        self.floor = floor
        self.capacity = capacity
        self.isAvailable = isAvailable
        self.isALab = isALab
        
    def __str__(self):
        return f"classroom number: {self.classroomNo}\nfloor: {self.floor}\ncapacity: {self.capacity}\nis available?: {self.isAvailable}\nis a lab?: {self.isALab}"
        
    def display_classroom_num(self):
        return f"classroom number: {self.classroomNo}"


class Report:
    def __init__(self,reportId, classroomNo, date, issueType, problemDesc, User, status='In Progress'):  #i removed image path for now
        self.reportId = reportId
        self.classroomNo = classroomNo
        self.date = date
        self.issueType = issueType
        self.problemDesc = problemDesc
        self.status = status
        self.User = User
     #  self.imgpath = imgpath
    
    def updateStatus(self, reportId, new_status):
        if new_status.lower() == "issue solved":
            self.status = "Issue Solved"
        elif new_status.lower() == "in progress":
            self.status = "In Progress"
        else:
            print("Invalid status provided. Status remains unchanged.")


    def __str__(self):
        return f"reportId: {self.reportId}\nIssuer: {self.User.name}\nclassroomNo: {self.classroomNo}\ndate: {self.date}\nissueType: {self.issueType}\nproblemDesc: {self.problemDesc}"

#----------------------testing sprint 2 ----------------------------------------------------
print("------------testing for reports and reporting (maintenance)-----------------")
lana = FacultyMember("Lana","0506616414","lnln@gmail.com","Software Engineering",2222)
temp = Report(1234, 21, '27-10-2024', 'technology', 'the projector does not work',lana)
print(temp)
print("\n")
#test for update status of report
temp2 = Report(1111, 101, "2024-10-26", "Electrical", "Broken light", lana)
print(temp2.status)  # should be: In Progress

temp2.updateStatus(1111, "Issue Solved")
print(temp2.status)  # should be: Issue Solved

temp2.updateStatus(1111, "invalid status")  
print(temp2.status)  # should be: Issue Solved (unchanged)
print("\n")
print("------------testing for view availability (student view)------------------")

retal = Student("retal shilli","0569590127","tata@gmail.com","computer science",2211432,"software eng")
print(retal)
print("\n")
building11 = Building("buidling 11","main campus",3,100,2000,True)

classroom101 = Classroom(101,1,30,True,False)
classroom102 = Classroom(102,1,30,True,False)
classroom103 = Classroom(103,1,30,False,False)
classroom104 = Classroom(104,1,30,True,False)

building11.add_classroom(classroom101)
building11.add_classroom(classroom102)
building11.add_classroom(classroom103)
building11.add_classroom(classroom104)

building11.view_available(retal)