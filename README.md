
# Quick reference

-	**Maintained by**:  
	[RobsOnWaves](https://github.com/RobsOnWaves/cloudcmd_docker)

-	**Where to get help**:  
	[RobsOnWaves](https://github.com/RobsOnWaves/cloudcmd_docker)
	
-	**Cloud Commander website**:  
	[Cloud Commander website](https://cloudcmd.io/)

-	**Cloud Commander repository**:  
	[Cloud Commander repository](https://github.com/coderaiser/coderaiser.github.io)


# Cloud Commander on Docker

Important note: I'm note a contribuer/maintener of Cloud Commander, I just found this tool very useful and very "dockerizable".

From [Cloud Commander website](https://cloudcmd.io/) : "*Cloud Commander is a file manager for the web. It includes a command-line console and a text editor. Cloud Commander helps you manage your server and work with files, directories and programs in a web browser from any computer, mobile or tablet.*"

Now, this image is aimed to mount the service easily for two particular use cases:

* Sharing only a specified folder, with authentication handled
* Sharing only a specified folder, without authentication


## Using this Image 

For all use cases, from the directory you will launch the service, create a `host_folder` directory:

```console
mkdir host_folder
```

NB: the content of `./host_folder/` will be the data uploaded from the users and/or that you want to be accessible for the users.

### docker run approach

1. With authentication
	
	Run this command:
	
	```console
	docker run -v $PWD/host_folder:/mnt/ls \
		-e "CLOUDCMD_USR=your_username" \
		-e "CLOUDCMD_PASS=your_password" \
		-p 8000:8000 -it --rm  robinatorondocker/cloudcmd
	```
	Then, in a web browser, enter : `http://localhost:8000` to access to the service

2. Without authentication:

	Run this command:
	
	```console
	docker run -v $PWD/host_folder:/mnt/ls \
		-p 8000:8000 -it --rm  robinatorondocker/cloudcmd
	```
	Then, in a web browser, enter : `http://localhost:8000` to access to the service


### docker-compose approach


1. With authentication

	From the directory you want to launch the service, create a docker-compose.yaml file with this content:
	
	```code
	version: '3.3'
	
	services:
	  cloud_commander:
	  
	    image:  robinatorondocker/cloudcmd
	    
	    restart: always
	    
	    environment:
	      CLOUDCMD_USR: your_username
	      CLOUDCMD_PASS: your_password
	
	    ports:
	      - 8000:8000
	      
	    volumes:
	      - $PWD/host_folder:/mnt/ls
	```
	
	Launch the service:
	
	```console
	docker-compose up -d
	```
	
	Then, in a web browser, enter : `http://localhost:8000` to access to the service.

2. Without authentication

	From the directory you want to launch the service, create a docker-compose.yaml file with this content:
	
	```code
	version: '3.3'
	
	services:
	  cloud_commander:
	    image:  robinatorondocker/cloudcmd
	    
	    restart: always
	
	    ports:
	      - 8000:8000
	      
	    volumes:
	      - $PWD/host_folder:/mnt/ls
	```
		
	Launch the service:
	
	```console
	docker-compose up -d
	```
	
	Then, in a web browser, enter : `http://localhost:8000` to access to the service.




