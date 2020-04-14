FROM python:3.7-alpine

WORKDIR /myapp

EXPOSE 5000

COPY Pipfile* ./

RUN pip install --no-cache-dir pipenv && \
    pipenv install --system --deploy --clear

COPY . .
CMD ["flask", "run", "--host=0.0.0.0"]