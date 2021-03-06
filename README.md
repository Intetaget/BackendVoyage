# Voyage API

A simple travel app to document your adventures!

## User Methods

### Signup/Registration

Register as a user to allow for creating new entries on the site.

**Route** /users/signup

**Method** GET

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username | String | *(Required)*  Must be unique |
| fullname      | String      |  *(Required)*   User's first and last name |
| email | String      | *(Required)*   User's email (must follow format text@text.text) |
| password | String | *(Requred)* User's password


**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
	{ "user": 
			{ "user_id": 1,
			  "access_key": "0be09d37d1d5e61f06b4a10133492003"
			}
	}
			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
	{"errors":[
				"Email has already been taken",
				"Username has already been taken"
				]
	}
```

### Login ###

User can login to retrieve her access token and account email address.

**Route** /users/login

**Method** POST

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username | String | *(Required)* Existing user's username | 
| password | String | *(Required)* User's password | 

**Response**

If successful, you will receive:

	Status Code: 202 - Accepted
	
```
	{ "user": 
			{ "user_id": 1,
			  "access_key": "0be09d37d1d5e61f06b4a10133492003",
			  "email": "myusername"
			}
	}
			
```

If unsuccessful, you will receive:

	Status Code: 401 - Unauthorized
	
```
	{ "errors": [ 
				"Username or password incorrect. Please try again."
				] 
	}
```

## Images

### Upload a new image

Authenticated users can create images. 

**Route** "journeys/:journey_id/images"

**Method** POST

***REQUIRED IN HEADERS*** : Access-Token = string

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id | Integer | *(Required)* | 
| photo | file |.jpg .jpeg etc|
|description|t.string|Photo description			|

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```
	{ "image": 
			{ "id": 2
				"journey_id": 1,
			  "photo_file_name": "terrific.jpeg",
			  "description": "my awesome trip"
			}
	}			
```

If unsuccessful, you will receive:

	Status Code: 404 - Unprocessable Entity

### Get an index of images

**Route** /"journeys/:journey_id/images"

**Method** GET

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id| integer | *(Required)* | 

**Response**

If successful, you will receive:

	Status Code: 200 - OK


If unsuccessful, you will receive:

	Status Code: 404 - Not Found

	```
	{ "image": 
			{ "id": 2
				"journey_id": 1,
			  "photo_file_name": "terrific.jpeg",
			  "description": "my awesome trip"
			}
	}		
	```

### Delete Image###

Authenticated users can delete an image that they have created.

**Route** "images/:image_id", to: "images#destroy"

**Method** DESTROY

***HEADERS*** : Access-Key = String


| Parameter        | Type           | Description  |
| ---------------- |----------------|------------- |
| image_id| Integer | Required | 


**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
```
		{
			"The image has been deleted successfully."
		}	
```

If unsuccessful, you will receive:

	Status Code: 401 - Not Authorized
	
```
	{ "errors": [ 
				"You're not authorized to delete this image"
				] 
```

## Journeys

### Index

Retrieve a list of all the user's journeys

**Route** "/journeys"

**Method** GET

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| user_id  | integer | *(Required)*  |
| title      | t.string      |  *(Required)*    |
| description | String      | *(Required)* journey description |
| region | t.string | *(Required)* |
|

**Response**

If successful, you will receive:

	Status Code: 201 - Created

```
  "journeys": [
    {
      "id": 2,
      "title": "My first trip",
      "description": "Trip to Uruguay",
      "region": "South America",
      "user_id": 13,
      "photo_url": "http://voyage-prod.s3.amazonaws.com/journeys/photos/000/000/002/original/uruguay.jpg"
    }
   ]
 ```

If the request fails, you will get:

```
{ error: "There are no journeys to display." }
```

	Status Code: 404 - Not Found
	
	
### Create

Create a new journey

**Route** "/journeys"

**Method** GET

	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| title  | t.string | *(Required)*  |
| description      | t.string      |  *(Required)*    |
| region | t.string | *(Required)* |
| user_id |integer	 |*(Required)*

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
	```
	{	"journey":
      "id": 3,
      "title": "My second trip",
      "description": "Trip to Ireland",
      "region": "Europe",
      "user_id": 13,
      "photo_url": "http://voyage-prod.s3.amazonaws.com/journeys/photos/000/000/003/original/Irish-ruins.jpg"
    }
    ```

If the request fails, you will get:

	Status Code: 402 - Unauthorized

	
### Update

Update an existing journey

**Route** "journeys/:journey_id"

**Method** PATCH

	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| title  | t.string | *(Required)*  |
| description      | t.string      |  *(Required)*    |
| region | t.string | *(Required)* |
|user_id |integer	 |*(Required)*

**Response**

If successful, you will receive:

	Status Code: 202 - Accepted
	
	```
	{	"journey":
      "id": 3,
      "title": "My second trip",
      "description": "Trip to Ireland",
      "region": "Europe",
      "user_id": 13,
      "photo_url": "http://voyage-prod.s3.amazonaws.com/journeys/photos/000/000/003/original/Irish-ruins.jpg"
    }
    ```

If the request fails, you will get:

	Status Code: 422 - Unprocessable Entity
	
	```
	{ error: "The journey you've requested does not exist." }
	```
	
### Show

Find a specific journey

**Route** journeys/:journey_id"

**Method** GET


| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id  | integer | *(Required)*  |

**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
	```
	{	"journey":
      "id": 3,
      "title": "My second trip",
      "description": "Trip to Ireland",
      "region": "Europe",
      "user_id": 13,
      "photo_url": "http://voyage-prod.s3.amazonaws.com/journeys/photos/000/000/003/original/Irish-ruins.jpg"
    }
    ```

If the request is unsuccessful, you will get:

	Status Code: 404 - Not Found

	```
	{ error: "The journey you've requested does not exist." }
	```
	
### Delete

Delete an existing journey

**Route** journeys/:journey_id"

**Method** DESTROY

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id  | integer | *(Required)*  |

**Response**

If successful, you will receive:

	Status Code: 202 - Accepted
	
	{
		"The journey has been deleted."
	}

If the request was unsuccessful, you will get:

	Status Code: 404 - Not Found

	```
	{ error: "The journey you've requested does not exist." }
	```
	
	

	

	



