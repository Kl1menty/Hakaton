from flask import Flask

app = Flask(__name__)


@app.route('/')
@app.route('/index')
def index():
    return "Привет, Яндекс!"


@app.route('/login')
def login():
    return f'''
    <label for="name">Name (4 to 8 characters):</label>

<input type="text" id="name" name="name" required minlength="4" maxlength="8" size="10" />
'''


if __name__ == '__main__':
    app.run(port=8080, host='127.0.0.1')
