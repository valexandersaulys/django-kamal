FROM python:3.11-alpine
EXPOSE 8000

# required for kamal, specific for Alpine
RUN apk add curl
RUN ln -s /usr/bin/curl /bin/curl

RUN python3.11 -m pip install django

WORKDIR /workarea
COPY . /workarea

CMD ["python3.11", "manage.py", "runserver", "0.0.0.0:8000"]