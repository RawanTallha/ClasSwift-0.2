import tkinter as tk
from tkinter import messagebox, simpledialog, ttk

# Sample classes and a record of reserved bookings
all_classes = ["Class A", "Class B", "Class C", "Class D"]
reserved_classes = []
user_type = ""
actions_performed = ""  # To track user actions


def login():
    global user_type
    options = ["Student", "Faculty", "Maintenance"]
    user_type = simpledialog.askstring("Login", "Login as (Student, Faculty, Maintenance):")
    show_welcome_page()
    
    # if user_type and user_type in options:
    #     show_welcome_page()
    # else:
    #     messagebox.showinfo("Error", "No valid user type selected. Returning to login.")
    #     login()

def show_welcome_page():
    global actions_performed
    welcome_message = f"Hello {user_type}!\nActions performed:\n{actions_performed.strip()}"

    root = tk.Tk()
    root.withdraw()  # Hide the root window

    # Option dialog using `messagebox` and `askquestion`
    selection = simpledialog.askstring("Welcome", f"{welcome_message}\n\nChoose an action:\n1. Book a Class\n2. Show Available Classes\n3. Exit")

    if selection == '1':
        root.destroy()  # Close the root window
        book_class()
    elif selection == '2':
        root.destroy()  # Close the root window
        show_available_classes()
    else:
        messagebox.showinfo("Goodbye", "Thank you for using the Class Booking App!")
        root.quit()


def book_class():
    global actions_performed

    def on_book():
        selected_class = class_combobox.get()
        if selected_class:
            if selected_class in reserved_classes:
                messagebox.showinfo("Error", f"{selected_class} is already reserved.")
            else:
                confirmation = messagebox.askyesno("Confirm Booking", f"Are you sure you want to book {selected_class}?")
                if confirmation:
                    reserved_classes.append(selected_class)
                    actions_performed += f"Booked: {selected_class}\n"
                    messagebox.showinfo("Success", f"{selected_class} has been booked successfully!")
                else:
                    messagebox.showinfo("Cancelled", "Booking canceled.")
            booking_window.destroy()
            show_welcome_page()
        else:
            messagebox.showinfo("Error", "Please select a class.")

    booking_window = tk.Tk()
    booking_window.title("Book a Class")

    class_label = tk.Label(booking_window, text="Select a class to book:")
    class_label.pack()

    class_combobox = ttk.Combobox(booking_window, values=all_classes)
    class_combobox.pack()

    book_button = tk.Button(booking_window, text="Book Class", command=on_book)
    book_button.pack()

    booking_window.mainloop()


def show_available_classes():
    global actions_performed
    available_message = "Available Classes:\n"
    for clazz in all_classes:
        status = "Reserved" if clazz in reserved_classes else "Available"
        available_message += f"{clazz} - {status}\n"

    messagebox.showinfo("Available Classes", available_message)
    actions_performed += "Viewed available classes.\n"
    show_welcome_page()


# Start the application
if __name__ == "__main__":
    login()
