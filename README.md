# <center> Airflow Exercise </center> 
### Full Name: Aarón Martin Castillo Medina 
### Email: aaroncastillo329@gmail.com

<br>

The following project consists in the installation of a simple Airflow environment and the implementation of a DAG.

By default, all DAG examples are disabled. 

It's important to install Docker before this execution, whose instructions are not included in this README.

The project's structure is the following: 

```
.
|-- dags
| `-- my_first_dag,py
|-- Dockerfile

```

<br>

I briefly explain each one of these elements: 

* **my_first_dag,py** - the code that creates the dag. 
* **Dockerfile** - file requested to initialize the server.

<br>

In order to execute the code by using docker, you should utilize the following commands: 

<br>

```console
docker build --tag docker_airflow .
```

<br>

<center> (Don't forget the dot at the end) </center> 

<br>
<br>

And then:

```console
docker run -d --name airflow_final -p 80:80 docker_airflow
```

<br>
