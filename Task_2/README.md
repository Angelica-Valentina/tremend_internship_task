# Task 2

1. Dockerfile
  - I chose to work with the application in Python.
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
  - I did the local testing.
  
    ![Picture6](https://github.com/Angelica-Valentina/tremend_intership_task/assets/129442693/626031fa-5731-40ef-bf2d-02b37197fdbe)

  - I set up the a Docker Registry. 

2. Docker Build Workflow
  - For automation, I chose to work with Docker Built Workflow because it automates the process of building and pushing a Docker image to Docker Hub whenever changes are pushed to the main branch.
  - It works like this:
    - Trigger: It runs on push events to the main branch.
    - Jobs:
      - Built: It executes on an Ubuntu latest runner.
        - It checks out the code from the repository.
        - It authenticates with Docker Hub using the provided username and password secrets.
        - It builds a Docker image using the Dockerfile in the repostory, tags it with the SHA of the commit, and pushes it to Docker Hub.
    ```
    name: Docker Build and Push

    on:
      push:
        branches:
          - main
          - master
    
    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
          - name: Checkout code
            uses: actions/checkout@v3

      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build Docker image
        run: docker build -t your-dockerhub-username/my_app:latest .
        working-directory: .

      - name: Tag Docker image
        run: docker tag your-dockerhub-username/my_app:latest your-dockerhub-username/my_app:${{ github.sha }}

      - name: Push Docker image
        run: docker push your-dockerhub-username/my_app
    ```
