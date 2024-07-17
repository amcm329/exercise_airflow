FROM python:3.9

EXPOSE 5000

# ***** Creating both backups (avro) and sources (csv) folders. *****

RUN mkdir /home/backups

RUN mkdir /home/sources

RUN mkdir /home/logs

RUN mkdir /home/airflow/

RUN mkdir /home/airflow/dags

COPY dags/* /home/airflow/dags

WORKDIR /app

#Left is your host (the path where the docker is) and right is the container's path.

COPY app/requirements.txt /app

RUN apt -qq -y update && apt -qq -y upgrade
	
RUN pip install --upgrade pip

#RUN pip install -r requirements.txt

RUN pip install "apache-airflow[celery]==2.9.2" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.9.2/constraints-3.8.txt"

#To load/remove examples by default. 
#https://www.restack.io/docs/airflow-knowledge-apache-remove-example-dags
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

#To put your base folder
#https://stackoverflow.com/questions/45534535/airflow-not-loading-dags-in-usr-local-airflow-dags
ENV AIRFLOW__CORE__DAGS_FOLDER=/home/airflow/dags

RUN airflow db init

#Creating my sample account. 
RUN airflow users create \
    --username admin \
    --firstname Aaron \
    --lastname Castillo \
    --role Admin \
	--password hola123, \
    --email aaroncastillo329@gmail.com

#Deprecated 
#RUN airflow scheduler &

#Only final CMD to execute the server: 
#https://stackoverflow.com/questions/37461868/difference-between-run-and-cmd-in-a-dockerfile
#https://stackoverflow.com/questions/65881570/airflow-webserver-doesnt-find-scheduler-in-docker-compose
CMD airflow webserver --port 80 & airflow scheduler  #python3 -m airflow

