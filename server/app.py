from fileinput import filename
from crypt import methods
from flask import *
app = Flask(__name__)


@app.route("/")
def hello_world():
    return render_template('ind.html')


@app.route("/gopal", methods=['GET', 'POST'])
def hello_gopal():
    input_name = request.args.get('value')
    year = float(input_name)
    return jsonify({
        "name": -0.0132 * year + 37.2261
    })


if __name__ == '__main__':
    app.run()
