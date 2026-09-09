from flask import Blueprint, render_template, request

bp = Blueprint("supervisor", __name__)

@bp.route("/supervisor/login/")
def supervisor_login():
    return "<h1>This is the supervisor login page</h1>"

@bp.route("/supervisor/signup/")
def supervisor_signup():
    return "<h1>This is the supervisor create account page</h1>"