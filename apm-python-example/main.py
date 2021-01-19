from flask import Flask
from elasticapm.contrib.flask import ElasticAPM
app = Flask(__name__)
app.config['ELASTIC_APM'] = {
    'SERVICE_NAME': 'FlaskApp',
    'SECRET_TOKEN': '',
    'SERVER_URL': 'http://apm-server:8200'
}
apm = ElasticAPM(app)


@app.route('/')
def index():
    return """<p align="center">
                <img src="https://i.giphy.com/media/gLcUG7QiR0jpMzoNUu/giphy.webp">
                </p>"""


@app.route('/exceptions')
def exceptions():
    return 1 / 0


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
