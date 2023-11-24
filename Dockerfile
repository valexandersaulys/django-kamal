FROM python:3.11-alpine
EXPOSE 8000

RUN python3.11 -m pip install django

WORKDIR /workarea
COPY . /workarea

CMD ["python3.11", "manage.py", "runserver", "0.0.0.0:8000"]