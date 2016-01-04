Official Orangehrm Docker image

How to use this image
=====================

```
docker run --name some-orangehrm -p 8080:80 --link some-mysql:mysql -d orangehrm/orangehrm
```