# <center> Fast API Exercise </center> 
### Full Name: Aarón Martin Castillo Medina 
### Email: aaroncastillo329@gmail.com

<br>

The following project consists in the development of a system that creates a API REST.

The tool used for API REST is Fast API (0.111.0) and Docker.

It's important to install Docker before this execution, whose instructions are not included in this README.

The project's structure is the following: 

```
.
|-- app
| ´-- app.py 
| ´-- requirements.txt 
|-- sources
| `-- foo.txt
|-- Dockerfile
|-- simulation_interactions.py

```

<br>

I briefly explain each one of these elements: 

* **app.py** - the file that contains the Fast Api server. 
* **requirements.txt** - Python libraries that are required for the project. 
* **foo.txt** - file required to maintain the sources folder. 
* **Dockerfile** - file requested to initialize the server.
* **simulation_interactions.py** - file created to emulate the actions from the user perspective (requests).

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
