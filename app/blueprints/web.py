from flask import Blueprint, render_template, request

bp = Blueprint("web", __name__)

@bp.route("/")
def home_page():
    return render_template('index.html')
