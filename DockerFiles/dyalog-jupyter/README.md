# Docker Dyalog Jupyter Notebooks
## Usage
### Running the container:
Run the container with the following command changing the path to your source
```sh
cd jupyter
docker build -t dyalog-jupyter .
docker run -it --user dyalog -e DISPLAY=$DISPLAY -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix dyalog-jupyter
```
### Access the Web Interface

Once the container is running, you will be able to navigate to http://localhost:8080, you will see a web form to query the REST Server.
