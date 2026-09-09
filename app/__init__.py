from flask import Flask, request
import mysql.connector
from app.blueprints import web, user, student, adviser, supervisor

app = Flask(__name__)

# Secret key for session management
app.config['SECRET_KEY'] = 'de0bb4ffc1ea8f6f8b4657f93d9acee3'

# Database configuration
app.config['MYSQL_HOST'] = 'localhost'  # or your host IP
app.config['MYSQL_USER'] = 'cyrus'
app.config['MYSQL_PASSWORD'] = 'exhaustport'
app.config['MYSQL_DB'] = 'dbInternshipEvalSys'

app.register_blueprint(web.bp)
app.register_blueprint(user.bp)
app.register_blueprint(student.bp)
app.register_blueprint(adviser.bp)
app.register_blueprint(supervisor.bp)


if __name__ == '__main__':
    app.run(debug=True)
