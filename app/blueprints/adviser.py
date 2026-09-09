from flask import Blueprint, render_template, request

bp = Blueprint("adviser", __name__)

@bp.route("/adviser/login/")
def adviser_login():
    return "<h1>This is the adviser login page</h1>"

@bp.route("/adviser/signup/")
def adviser_signup():
    return "<h1>This is the adviser create account page</h1>"

@bp.route("/adviser/dashboard/")
def adviser_dashboard():
    return render_template('adviser-dashboard-page.html')

@bp.route("/adviser/student/")
def adviser_student():
    return render_template('adviser-student-page.html')

@bp.route("/adviser/student-profile/")
def adviser_studentProfile():
    return render_template('adviser-student-profile.html')

@bp.route("/adviser/analytics/")
def adviser_analytics():
    return render_template('adviser-analytics-page.html')

@bp.route("/adviser/evaluation-form1/")
def adviser_evaluationForm1():
    return render_template('adviser-evaluationform1-page.html')

@bp.route("/adviser/evaluation-form2/")
def adviser_evaluationForm2():
    return render_template('adviser-evaluationform2-page.html')

@bp.route("/adviser/evaluation-form3/")
def adviser_evaluationForm3():
    return render_template('adviser-evaluationform3-page.html')

@bp.route("/adviser/college/")
def adviser_college():
    return render_template('adviser-college-page.html')


