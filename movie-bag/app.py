from waitress import serve
from flask import Flask, request, Response
from database.db import initialize_db
from database.models import Movie
import json
import urllib.parse

app = Flask(__name__)

username = urllib.parse.quote_plus('admin')
password = urllib.parse.quote_plus('admin')

app.config['MONGODB_SETTINGS'] = {
    'host': 'mongodb://test-mongo/movie-bag'
}

initialize_db(app)


@app.route('/')
def index():
    return "<h2>LAB 🐍 </h2>"


@app.route('/movies')
def get_movies():
    movies = Movie.objects().to_json()
    return Response(movies, mimetype="application/json", status=200)


@app.route('/movies', methods=['POST'])
def add_movie():
    body = request.get_json()
    movie = Movie(**body).save()
    id = movie.id
    return {'id': str(id)}, 200


@app.route('/movies/<id>', methods=['PUT'])
def update_movie(id):
    body = request.get_json()
    Movie.objects.get(id=id).update(**body)
    return '', 200


@app.route('/movies/<id>', methods=['DELETE'])
def delete_movie(id):
    movie = Movie.objects.get(id=id).delete()
    return '', 200


@app.route('/movies/<id>')
def get_movie(id):
    movies = Movie.objects.get(id=id).to_json()
    return Response(movies, mimetype="application/json", status=200)


# To run in development
# app.run()

# To run in production
serve(app, host="0.0.0.0", port=5000)
