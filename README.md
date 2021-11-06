# Inception
School 42 Inception project

### Requirements
A small infrastructure composed of different services under specific rules using docker-compose.  
Things that must be set up:
- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3
- A Docker container that contains WordPress + php-fpm
- A Docker container that contains MariaDB
- A volume that contains WordPress database
- A second volume that contains WordPress website files
- docker-networks between these containers

### .env file
You can configure some values (database password, wordpress key etc.) by setting environment variables in ```.env``` file.  
Default values have been already set.

### WordPress users credentials
In WordPress database, there are two users, one of them being the administrator.  
Admin user:  
```dmitris XXckIql1LbXCYReNkt```  
Subscripber:  
```paul98 HEeqFbTY^*Ojokfcaz*JwxdT```

### Diagram
Example diagram of the infra:
![diagram](https://user-images.githubusercontent.com/34074848/137622165-273553ba-57bb-4d4c-b94b-3819a427de5e.png)
