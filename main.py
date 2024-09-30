
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
        print("the classroom you entered is occupied!")
            
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

#----------------------testing--------------------------

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
