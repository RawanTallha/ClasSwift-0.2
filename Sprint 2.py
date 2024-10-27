class User:
  def __init__(self, name, phoneNumber, email):
    self.name = name
    self.phoneNumber = phoneNumber
    self.email = email

  def __str__(self):
    return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\n" 

class FacultyMember (User):
    def __init__(self,name, phoneNumber, email, facultyID, department):
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.facultyID = facultyID
        self.department = department
              
    def __str__(self):
        return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\nfaculty ID: {self.facultyID}\ndepartment: {self.department}"      

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
            
    def find_alternative(self,FacultyMember): 
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
            
    def __str__(self):
        return f"building number: {self.buildingNo}\nlocation: {self.location}\nnumebr of floors: {self.numOfFloors}\nnumber of classrooms: {self.numOfClassrooms}\ncapacity: {self.capacity}\naccesible?: {self.accesible}"
    
class Classroom:
    
    def __init__(self, classroomNo, capacity, isAvailable, isALab):
        self.classroomNo = classroomNo
        self.capacity = capacity
        self.isAvailable = isAvailable
        self.isALab = isALab
        
    def __str__(self):
        return f"classroom number: {self.classroomNo}\ncapacity: {self.capacity}\nis available?: {self.isAvailable}\nis a lab?: {self.isALab}"
        
    def display_classroom_num(self):
        return f"classroom number: {self.classroomNo}"

class Maintenance(User):
    def __init__(self,name, phoneNumber, email, department, maintenanceId ):
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.department = department
        self.maintenanceId = maintenanceId
    

    def __str__(self):
        return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\ndepartment: {self.department}\nmaintenanceId: {self.maintenanceId}"


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

#----------------------testing sprint 1 (find alternative)--------------------------
'''
building11 = Building("buidling 11","main campus",3,100,2000,True)

classroom101 = Classroom(101,30,True,False)
classroom102 = Classroom(102,30,True,False)
classroom103 = Classroom(103,30,False,False)
classroom104 = Classroom(104,30,True,False)

building11.add_classroom(classroom101)
building11.add_classroom(classroom102)
building11.add_classroom(classroom103)
building11.add_classroom(classroom104)
print(building11)
print("\n")
building11.display_classrooms()

tata = FacultyMember('tata','0505509719','retal.shilli@uj.edu.sa',1000,'computer sience') #instances of faculty to test find alternative function for building 11
lala = FacultyMember("lala","053456789","lala@gmail.com",1115,"computer sience")
building11.find_alternative(tata)
print("\n")
building11.find_alternative(lala) 
'''
#----------------------testing sprint 2 (file a report and update status)--------------------------
lana = FacultyMember("Lana","0506616414","lnln@gmail.com",2222,"Software Engineering")
temp = Report('1234', '21', '27-10-2024', 'technology', 'the projector does not work',lana)
print(temp)
#test for update status of report
temp2 = Report(1111, "A101", "2024-10-26", "Electrical", "Broken light", lana)
print(temp2.status)  # should be: In Progress

temp2.updateStatus(1111, "Issue Solved")
print(temp2.status)  # should be: Issue Solved

temp2.updateStatus(1111, "invalid status")  
print(temp2.status)  # should be: Issue Solved (unchanged)
