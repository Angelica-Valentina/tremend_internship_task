# Task 2

1. Dockerfile
  - I created a new folder where I created a Dockerfile which had the instruction:
    ```
    FROM python:3.8-slim
    WORKDIR /app
    COPY app.py .
    CMD ["python", "app.py"]
    ```
    Dockerfile uses python:3.8-slim base image.
    Its working directory was /app.
    Dockerfile copied app.py file to working directory and set command to run application.
  
  - I ran the command to obtain the Docker image using the Dockerfile and finally run the application.
  
    ![Picture6](https://github.com/Angelica-Valentina/tremend_intership_task/assets/129442693/626031fa-5731-40ef-bf2d-02b37197fdbe)

2. Docker Build Workflow
  - This GitHub Actions workflow automates the process of building and pushing a Docker image to Docker Hub whenever changes are pushed to the main branch.
