
class user:
  def __init__(self, name, phoneNumber, email):
    self.name = name
    self.phoneNumber = phoneNumber
    self.email = email

  def __str__(self):
    return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\n" 

class facultyMember (user):
    def __init__(self,name, phoneNumber, email, facultyID, department):
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.facultyID = facultyID
        self.department = department
        
    #def findAlternative(self,buildingNum):
        
        
    def __str__(self):
        return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\nfaculty ID: {self.facultyID}\ndepartment: {self.department}"      

class classroom:
    def __init__(self, buildingNo, classroomNo, capacity, isAvailable, isALab):
        self.buildingNo = buildingNo
        self.classroomNo = classroomNo
        self.capacity = capacity
        self.isAvailable = isAvailable
        self.isALab = isALab
        
    def showClassroom(self):
        return f"building number: {self.buildingNo}\nclassroom number: {self.classroomNo}\ncapacity: {self.capacity}\nis available: {self.isAvailable}\nis a lab: {self.isALab}"
        
    def __str__(self):
        return f"classroom number: {self.classroomNo}"


# linked list to store objeects of classrooms class here

class Node:
    def __init__(self, classroomObj):
        self.classroomObj = classroomObj
        self.next = None
        
class LinkedList:
    def __init__(self):
        self.head = None

    def add_classroomobj(self, classroomObj):
        new_node = Node(classroomObj)
        if self.head is None:
            self.head = new_node
        else:
            current = self.head
            while current.next:
                current = current.next
            current.next = new_node

    def display(self): #to print the linked list
        if self.head is None:	
            print("Linked list is empty.")
        else:
            current = self.head
            count = 1
            while current:
                print(f"[{count}] {current.classroomObj}\n")
                current = current.next
                count += 1

    def get_length(self):
        length = 0
        current = self.head
        while current:
            length += 1
            current = current.next
        return length
    
    def getHead(self):
        return self.head

#----------------------testing--------------------------
# Example usage linke list of classrooms objects testing
classroom100 = classroom(11,100,30,True,False)
classroom102 = classroom(11,102,30,True,False)
classroom103 = classroom(11,103,30,False,False)
classroom104 = classroom(11,104,30,True,False)


building11 = LinkedList()
building11.add_classroomobj(classroom100)
building11.add_classroomobj(classroom102)
building11.add_classroomobj(classroom103)
building11.add_classroomobj(classroom104)

building11.display()
print(f"Length: {building11.get_length()}")