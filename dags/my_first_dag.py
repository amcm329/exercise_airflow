from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
    'retries': 1,
}

dag = DAG(
    dag_id='example_dag',
    default_args=default_args,
    description='An example DAG',
    schedule_interval='0 0 * * *',  # Runs daily at midnight UTC
)

task1 = BashOperator(
    task_id='task1',
    bash_command='echo "Hello World"',
    dag=dag,
)

task2 = BashOperator(
    task_id='task2',
    bash_command='echo "Another task"',
    dag=dag,
)

task2 << task1  # task2 depends on task1
