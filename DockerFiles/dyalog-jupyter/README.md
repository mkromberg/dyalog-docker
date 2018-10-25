# Dyalog JSON Server
## Usage
### Running the container:
Run the container with the following command changing the path to your source
```sh
cd jupyter
docker build -t dyalog-jupyter .
docker run -p 8888:8888 dyalog-jupyter
```
### Access the Web Interface

Once the container is running, you will be able to navigate to http://localhost:8080, you will see a web form to query the REST Server.
