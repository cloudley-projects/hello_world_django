FROM ubuntu

COPY . /hello_world_django
WORKDIR /hello_world_django
Run ls .
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  python3-pip \
  python3-dev \
  default-libmysqlclient-dev \
  build-essential \
  gunicorn \
  && rm -rf /var/lib/apt/lists/*
RUN pip3 install -r requirements.txt
EXPOSE 8000
CMD ["gunicorn","--chdir","/hello_world_django", "--bind", ":8000", "--workers", "3", "project_name.wsgi:application"]
