# Dyalog MiServer
## Usage
###Running the container:
Run the container with the following command to run the MiServer Sample site.
```sh
docker run -p 8080 dyalog/miserver
```

To run with your own MiSite run the following command:
```sh
docker run -p 8080 -v /path/to/misite:/misite dyalog/miserver
```

### Access the Website

Once the container is running you will be able to access the website via http://localhost8080
