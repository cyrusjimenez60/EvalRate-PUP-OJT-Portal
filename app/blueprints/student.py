from flask import Blueprint, flash, render_template, request, redirect, url_for, current_app
import mysql.connector
from flask import current_app, g
import bcrypt

bp = Blueprint("student", __name__)

def get_db():
    if 'db' not in g:
        try:
            g.db = mysql.connector.connect(
                host=current_app.config['MYSQL_HOST'],
                user=current_app.config['MYSQL_USER'],
                password=current_app.config['MYSQL_PASSWORD'],
                database=current_app.config['MYSQL_DB']
            )
        except mysql.connector.Error as e:
            print(f"Error connecting to MySQL: {e}")
            g.db = None  # Handle gracefully or raise an error

    return g.db

@bp.route("/showdepartments/")
def index():
    cursor = get_db().cursor()
    cursor.execute('SELECT * FROM tblDepartment')
    results = cursor.fetchall()
    cursor.close()
    return str(results)

@bp.route("/student/login/", methods=['GET', 'POST'])
def student_login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        if not email or not password:
            flash('Please enter both Email and Password.', 'error')
            return render_template('student-login.html')

        print(f"Received email: {email}")
        print(f"Received password: {password}")
        
        conn = get_db()
        cursor = conn.cursor(dictionary=True)
        
        cursor.execute("SELECT * FROM tblStudentIntern WHERE strStudEmail = %s", (email,))
        user = cursor.fetchone()
        
        cursor.close()
        conn.close()
        
        if user and bcrypt.checkpw(password.encode('utf-8'), user['strStudPassHash'].encode('utf-8')):
            return redirect(url_for('student.student_dashboard'))
        else:
            flash('Incorrect Email or Password. Please try again.', 'error')
    
    return render_template('student-login.html')


# Route to handle both GET and POST requests
@bp.route('/student/signup/', methods=['GET', 'POST'])
def student_signup():
    if request.method == 'POST':
        # Handle form data
        email = request.form['email']
        password = request.form['password']
        first_name = request.form['firstname']
        middle_name = request.form.get('middlename', '')
        last_name = request.form['surname']
        student_id = request.form['studentid']
        contact = request.form['contact']
        department_id = int(request.form['department']) 
        course_name = request.form['course']
        section_code = request.form['section']
        academic_year = request.form['academic-year']
        supervisor = request.form['supervisor']

        conn = get_db()
        cursor = conn.cursor()

        try:
            # Insert into tblSection
            cursor.execute("""
                INSERT INTO tblSection (strAcadProg, strSectionCode, intDepartmentID, strAcadYear)
                VALUES (%s, %s, %s, %s)
            """, (course_name, section_code, department_id, academic_year))
            section_id = cursor.lastrowid  # Get the auto-incremented section ID

            # Ensures section_id is integer
            section_id = int(section_id)

            # Insert into tblStudentIntern
            salt = bcrypt.gensalt()
            passhash = bcrypt.hashpw(password.encode('utf-8'), salt)
            cursor.execute("""
                INSERT INTO tblStudentIntern (strStudentID, strStudLast, strStudFirst, strStudMiddle, strStudEmail, strStudPassHash, strStudPassSalt, strStudContact, intSectionID)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, (student_id, last_name, first_name, middle_name, email, passhash, salt, contact, section_id))

            conn.commit()
            # Redirect to the login page after successful signup
            return redirect(url_for('student.student_login'))
        
        except mysql.connector.Error as err:
            print(f"Error: {err}")
            conn.rollback()
            flash('An error occurred. Please try again later.', 'error')
        
        finally:
            cursor.close()
            conn.close()

    # Fetch supervisors for initial form render
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT strSupervisorFirst, strSupervisorLast FROM tblSupervisor")
    supervisors = cursor.fetchall()
    cursor.close()
    conn.close()

    # Render the initial signup form
    return render_template('student-signup.html', supervisors=supervisors)

@bp.route("/student/dashboard/")
def student_dashboard():
    return render_template('student-dashboard-page.html')

@bp.route("/student/evaluation-form1/")
def student_evaluationForm1():
    return render_template('student-form1-evaluation.html')

@bp.route("/student/evaluation-form2/")
def student_evaluationForm2():
    return render_template('student-form2-evaluation.html')

@bp.route("/student/evaluation-form3/")
def student_evaluationForm3():
    return render_template('student-form3-evaluation.html')