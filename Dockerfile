FROM python:3.8
ENV PYTHONDONTWRITEBYCODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /code
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system
COPY . /code/
ENTRYPOINT [ "gunicorn", "bookstore_project.wsgi", "-b", "0.0.0.0:8000" ]