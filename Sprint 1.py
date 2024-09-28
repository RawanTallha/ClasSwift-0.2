import tkinter as tk
from tkinter import messagebox, simpledialog, ttk
  

# Algorithm classes (for database and future sprints)
class user:
    def __init__(self, name, phoneNumber, email):
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email

    def __str__(self):
        return f"name: {self.name}\nphone number: {self.phoneNumber}\nemail: {self.email}\n" 

class facultyMember(user):
    def __init__(self, name, phoneNumber, email, facultyID, department):
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.facultyID = facultyID
        self.department = department

    def findAlternative(self, linkedlist):
        current = linkedlist.getHead()
        i = 0
        for i in range(linkedlist.get_length()):
            if current.classroomObj.isAvailable:
                print(f"{current.classroomObj.showClassroom()}\n")
            i += 1
            current = current.next

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

    def display(self):
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
    

# GUI classes and functionssss (for sprint 1 representation)
class GUI:
    def __init__(self):
        self.all_classes = ["Class A", "Class B", "Class C", "Class D"]
        self.reserved_classes = []
        self.user_type = ""
        self.actions_performed = ""
        self.root = tk.Tk()
        self.root.withdraw()
        self.login()

    def login(self):
        self.user_type = simpledialog.askstring("Login", "Login as (Student, Faculty, Maintenance):")
        self.show_welcome_page()

    def show_welcome_page(self):
        welcome_message = f"Hello {self.user_type}!\nActions performed:\n{self.actions_performed.strip()}"
        selection = simpledialog.askstring("Welcome", f"{welcome_message}\n\nChoose an action:\n1. Book a Class\n2. Show Available Classes\n3. Exit")

        if selection == '1':
            self.book_class()
        elif selection == '2':
            self.show_available_classes()
        else:
            messagebox.showinfo("Goodbye", "Thank you for using ClasSwift!")
            self.root.quit()

    def book_class(self):
        def on_book():
            selected_class = class_combobox.get()
            if selected_class:
                if selected_class in self.reserved_classes:
                    messagebox.showinfo("Error", f"{selected_class} is already reserved.")
                else:
                        self.reserved_classes.append(selected_class)
                        self.actions_performed += f"Booked: {selected_class}\n"
                        messagebox.showinfo("Success", f"{selected_class} has been booked successfully!")
                    
                booking_window.destroy()
                self.show_welcome_page()
            else:
                messagebox.showinfo("Error", "Please select a class.")

        booking_window = tk.Tk()
        booking_window.title("Book a Class")

        class_label = tk.Label(booking_window, text="Select a class to book:")
        class_label.pack()

        class_combobox = ttk.Combobox(booking_window, values=self.all_classes)
        class_combobox.pack()

        book_button = tk.Button(booking_window, text="Book Class", command=on_book)
        book_button.pack()

        booking_window.mainloop()

    def show_available_classes(self):
        available_message = "Available Classes:\n"
        for clazz in self.all_classes:
            status = "Reserved" if clazz in self.reserved_classes else "Available"
            available_message += f"{clazz} - {status}\n"

        messagebox.showinfo("Available Classes", available_message)
        self.actions_performed += "Viewed available classes.\n"
        self.show_welcome_page()

if __name__ == "__main__":
    app = GUI()   