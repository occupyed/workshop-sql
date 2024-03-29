import mysql.connector

def connect_to_database():
    try:
        # Establish a connection to the MySQL database
        connection = mysql.connector.connect(
            host="localhost",  # Update with your host
            user="your_username",  # Update with your username
            password="your_password",  # Update with your password
            database="StudentDB"  # Update with your database name
        )
        print("Connected to MySQL database")
        return connection
    except mysql.connector.Error as error:
        print("Failed to connect to MySQL database:", error)
        return None

def create_student(name, date_of_birth, gender, email):
    connection = connect_to_database()
    if connection:
        try:
            cursor = connection.cursor()
            # Execute an INSERT query to add a new student
            cursor.execute("INSERT INTO Students (student_name, date_of_birth, gender, email) VALUES (%s, %s, %s, %s)",
                           (name, date_of_birth, gender, email))
            connection.commit()
            print("Student created successfully")
        except mysql.connector.Error as error:
            print("Failed to create student:", error)
        finally:
            # Close cursor and connection
            cursor.close()
            connection.close()

def read_students():
    connection = connect_to_database()
    if connection:
        try:
            cursor = connection.cursor()
            # Execute a SELECT query to retrieve all students
            cursor.execute("SELECT * FROM Students")
            students = cursor.fetchall()
            print("Student Information:")
            for student in students:
                print("Student ID:", student[0])
                print("Name:", student[1])
                print("Date of Birth:", student[2])
                print("Gender:", student[3])
                print("Email:", student[4])
                print()
        except mysql.connector.Error as error:
            print("Failed to retrieve students:", error)
        finally:
            # Close cursor and connection
            cursor.close()
            connection.close()

def update_student(student_id, new_email):
    connection = connect_to_database()
    if connection:
        try:
            cursor = connection.cursor()
            # Execute an UPDATE query to update student's email
            cursor.execute("UPDATE Students SET email = %s WHERE student_id = %s", (new_email, student_id))
            connection.commit()
            print("Student email updated successfully")
        except mysql.connector.Error as error:
            print("Failed to update student email:", error)
        finally:
            # Close cursor and connection
            cursor.close()
            connection.close()

def delete_student(student_id):
    connection = connect_to_database()
    if connection:
        try:
            cursor = connection.cursor()
            # Execute a DELETE query to remove a student
            cursor.execute("DELETE FROM Students WHERE student_id = %s", (student_id,))
            connection.commit()
            print("Student deleted successfully")
        except mysql.connector.Error as error:
            print("Failed to delete student:", error)
        finally:
            # Close cursor and connection
            cursor.close()
            connection.close()

# Example usage
if __name__ == "__main__":
    # Create a new student
    create_student("John Doe", "2000-01-01", "Male", "john.doe@example.com")
    
    # Read all students
    read_students()
    
    # Update a student's email
    update_student(1, "john.doe.updated@example.com")
    
    # Delete a student
    delete_student(1)
