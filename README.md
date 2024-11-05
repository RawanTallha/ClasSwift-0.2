# ClasSwift
Class = User --> 
  1.this class just has a constructor and is used for inheritance for the types of users 

Class = FacultyMember --> 
  1.this class has a constructor and a to_string

Class = Maintenance --> 
  1.this class has a constructor and a to_string

Class Student --> 
  1.this class has a constructor and a to_string

Class Building --> 
  1.this class has a constructor and a to_string
  2.add_classroom function == this function adds classroom objects to the building class
  3.display_classrooms function == has a loop that prints all objects(classrooms) inside the building
  4.find_alternative function == takes in a facutly id which makes it constarined to only the faculty use , proceeds to give user the option to book a class from available classes shown which are read from the building11 JSON file.
  5.view_available function == used for student view, reads from building11 JSON file 

Class Classroom --> 
  1.this class has a constructor and a to_string
  2.display_classroom_num function = shows classroom number

Class Report -->
  1.this class has a constructor and a to_string = the constructor takes in User as a parameter(cuz a user always creates a report)
  2.the constructor has an id that is randomly and uniquely generated  
  3.updateStatus function = this function takes in a new status and reportid so that the maintenance staff can update the status 
  4.the constaraint of having only the maintenance staff be able to update the status will be implemented using front end 

----------------------------------------JSON files code--------------------------------------
--All parts of the code are encapsulated between exceptions for errors
JSON database(building 11 + classrooms) --> 
  1.this opens the building11 json file and reads from it 
  2.inside that json file is the building information and that one building is filled with classroom objects(their information)
  3.we create an object building and give it the information read from the JSON file
  4.then we create a classroom object and give it all info for classes
  5.finally we add all classrooms to the building
  6.we use the function display_classrooms to print

JSON database(faculty members) -->   
  1.we create an array called faculty
  2.we open the faculty_members json file and read from it
  3.we create an object faculty and give it the information read from the JSON file for all faculty and store it in the array 
  4.finally we print 

JSON database(students) --> 
  1.we create an array called students
  2.we open the students json file and read from it
  3.we create an object student and give it the information read from the JSON file for all students and store it in the array 
  4.finally we print 

JSON database(maintenance_staff) --> 
  1.we create an array called maintenance_staff
  2.we open the maintenance_staff json file and read from it
  3.we create an object maintenance and give it the information read from the JSON file for all maintenance staff and store it in the array 
  4.finally we print 


  ----------------------------------------Remarks--------------------------------------
  - if we want to print one certain user (faculy,student,etc) we have to create a function called findbyid or smth like that (I have the code for it,but didn't see a need for it for now)
  - I changed the findalternative to take the ID of faculty so it's restricted to faculty only
  - The updatestatus function for the report class takes in only the reportid, we can make it take in a maintenance staff id so that it's restricted to maintenance staff only but i think that will be dnoe on frontend cuz there wont be such an option for anyone else anyways(if not it's easily done inshallah)
  - I wanted to create a nicer more organised testing rythm but don't have time so ill explain the output here. 
  first it should print all the classrooms in building 11 and their information. 
  second it should print all the faculty members and their information.
  third it should print a hello "faculty memebr name" --> by id and displays the available classrooms and asks which class the user wants to book 
  fourth it should display "unauthorised access" cuz i put in a wrong ID for findalternative
  fifth it should print all the students and their information
  sixth it should print all the maintenace staff and their information
  - i still need to figure out how to link the update status function for the report class with the json files but i dont have time now, already started will continue later :D

  ps: eveyrthing is read from the JSON files 