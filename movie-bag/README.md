Python API - Flask - MongoDB

RUN

```docker
docker run -d -p 27017:27017 mongo 
```
or

```bash
sudo systemctl start mongod.service 
```

```bash
pipenv install
pipenv shell
python app.py
```

JSON OBJECT

```json
{
    "name": "test",
    "casts": [
        "test"
    ],
    "genres": [
        "action"
    ]
}
```


POST

```bash
curl --location --request POST 'http://127.0.0.1:5000/movies' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "MrRobot",
    "casts": [
        "test"
    ],
    "genres": [
        "action"
    ]
}'
```


BUILD

```docker
docker build -t pytest-test .

docker-compose build

docker-compose up
```