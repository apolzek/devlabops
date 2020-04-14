## Python API - Flask - MongoDB

* Start MongoDB

```docker
docker run -d -p 27017:27017 mongo 
```
or

```bash
sudo systemctl start mongod.service 
```
---

* Install dependencies and run

```bash
pipenv install
pipenv shell
python app.py
```
---

* Json Object

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

---

* Post(curl 7.64.0)

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
---

* Build

```docker
docker build -t pytest-test .

docker-compose build

docker-compose up
```
