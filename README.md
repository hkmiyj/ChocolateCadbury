# TM Assessment
 Assessment Telekom Malaysia To Build Chocolate Report Mobile APP
## Backend
- Java Springboot Version 3.1.2
- Java 17

### Deploy Backend on Cloud Provider [Render](https://render.com/)
- Host Using Render with Dockers. 
- Take 4-5 Minutes on the first request because with Render Free Tier it shuts down after 15 mins of inactivity 

#### List of API Endpoints
- Get All List of Chocolate
```
[GET]https://chocolate-cadbury.onrender.com/chocolate
```
- Get All List of Chocolate By Type Of Chocolate
```
[GET]https://chocolate-cadbury.onrender.com/chocolate?chocolate_type=Caramel
```
- Get All List of Chocolate By Production Date
```
[GET]https://chocolate-cadbury.onrender.com/chocolate?production_date=28-Jan
```

### Backend on localhost
#### Installation
1. Run the Spring boot application with the java -jar command:
```
$ java -jar target/backend-cadbury-0.0.1-SNAPSHOT.jar
```
#### List of API Endpoints

- Get All List of Chocolate
```
[GET]http://localhost:8080/chocolate
```
- Get All List of Chocolate By Type Of Chocolate
```
[GET]http://localhost:8080/chocolate?chocolate_type=Caramel
```
- Get All List of Chocolate By Production Date
```
[GET]http://localhost:8080/chocolate?production_date=2023-01-28
```

### Frontend
Flutter version (3.10.6)


APK File

To download and install the app, click the following link: 
- APK Host Using Given API [Download APK](APK/app(given).apk)
- APK Host Using SpringBoot Backend Locally [Download APK](APK\app(local).apk)
- APK Host Using SpringBoot Backend Deploy On Render (Takes Time To Load On the first time) [Download APK](APK\app(Render).apk)

Run Debug Mode 
```
1. flutter pub get
2. flutter run

```