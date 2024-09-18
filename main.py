
class user:
  def __init__(self, name, phoneNumber, email):
    self.name = name
    self.phoneNumber = phoneNumber
    self.email = email

  def __str__(self):
    return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\n" 


class facultyMember (user):
    def __init__(self,name, phoneNumber,email, facultyID, department):
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.facultyID = facultyID
        self.department = department
        
    def __str__(self):
        return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\nfaculty ID: {self.facultyID}\ndepartment: {self.department}"      