

**************
Task definition
**************
- It's a file that tells ECS how to run a single container
- Parameters include
    - The Docker image to use with each container in your task 
    - How much CPU and memory to use with each task or each container within a task 
    - The launch type to use, which determines the infrastructure that your tasks are hosted on 
    - The Docker networking mode to use for the containers in your task 
    - The logging configuration to use for your tasks 
    - Whether the task continues to run if the container finishes or fails 
    - The command that the container runs when it's started 
    - Any data volumes that are used with the containers in the task 
    - The IAM role that your tasks use

***************
Running locally
***************
$ export FLASK_APP=application.py      # To tell where your flask app lives
$ export FLASK_DEBUG=development # Set debug mode on
$ flask run

*****
Notes
*****
- https://www.youtube.com/watch?v=8oKlFu_CtwI&list=PL0hSJrxggIQoKLETBSmgbbvE4FO_eEgoB&index=83
- https://aws.amazon.com/blogs/devops/setting-up-a-ci-cd-pipeline-by-integrating-jenkins-with-aws-codebuild-and-aws-codedeploy/