# Backend Voyage api

Welcome to the BackendVoyage API docs, hope you find what you are looking for here!

## User Methods

### Signup

Register a new user and receive back the new user's access key and user id.

**URL** /users/signup

**Method** get

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | *(Required)*  unique username |
| fullname      | String      |  *(Required)*   User's first and last name |
| email | String      | *(Required)*   User's email (must follow format text@text.text) |
| password | String | *(Requred)* User's password


**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
	{ "user": 
			{ "user_id": 1,
			  "access_key": "biglongaccesskeyhere"
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

### Registration ###

Users can get their access_key by sending a username/password.

**URL** /users/login

**Method** POST

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username| String | *(Required)* Existing user's username | 
| password | String | *(Required)* User's password | 

**Response**

If successful, you will receive:

	Status Code: 202 - Accepted
	
```json
	{ "user": 
			{ "user_id": 1,
			  "access_key": "biglongaccesskeyhere",
			  "username": "myusername"
			}
	}
			
```

If unsuccessful, you will receive:

	Status Code: 401 - Unauthorized
	
```json
	{ "errors": [ 
				"User or password incorrect. So sorry you aren't getting in!"
				] 
	}
```

## Image Methods

### New Image

Authenticated users can create images. 


**URL** "journeys/:journey_id/images", to: "images#create"

**Method** POST


***REQUIRED IN HEADERS*** : Access-Token = string

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id| Integer | *(Required)* | 
| photo | file |.jpg .jpeg etc|
|description|t.string|Photo description			|


**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
	{ "images": 
			{ "journey_id": 1,
			  "photo_file_name": "terrific.jpeg",
			  "description": "my awesome trip"
			}
	}			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity

### List Images

Authenticated users can list ALL images available.

**URL** /"journeys/:journey_id/images", to: "images#index"

**Method** GET

***REQUIRED IN HEADERS*** : ....

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id| integer | *(Required)* | 

**Response**

If successful, you will receive:

	Status Code: 200 - OK


If unsuccessful, you will receive:

	Status Code: 404 - Not Found
	```


### Delete Image###

Authenticated users can delete an image that they have created.

**URL** "images/:image_id", to: "images#destroy"

**Method** DESTROY



***HEADERS*** : Access-Key = string


| Parameter        | Type           | Description  |
| ---------------- |----------------|------------- |
| image_id| Integer | Required | 


**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
```json
		{"success":	"The image has been deleted successfully."
		}	
```

If unsuccessful, you will receive:

	Status Code: 401 - Not Authorized
	
```json
	{ "errors": [ 
				"You're not authorized to delete this image"
				] 
```

## Journey's Methods

### Index

A user is able to view all other users journeys

**URL** "journeys", to: "journeys#index"

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
	

If failfull, you will get:

	Status Code: 422 - Unprocessable Entity
	
	
### Create

A user is able to create journeys

**URL** "journeys", to: "journeys#index"

**Method** GET


	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| title  | t.string | *(Required)*  |
| description      | t.string      |  *(Required)*    |
| region | t.string | *(Required)* |
|user_id |integer	 |*(Required)*

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	

If failfull, you will get:

	Status Code: 422 - Unprocessable Entity
	
	patch "journeys/:journey_id", to: "journeys#update"
	
	
	
### Update

A user is able to update journeys

**URL** "journeys", to: "journeys#index"

**Method** PATCH


	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| title  | t.string | *(Required)*  |
| description      | t.string      |  *(Required)*    |
| region | t.string | *(Required)* |
|user_id |integer	 |*(Required)*

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	

If failfull, you will get:

	Status Code: 422 - Unprocessable Entity
	
	
### Show

A user is able to show journeys

**URL** journeys/:journey_id", to: "journeys#show

**Method** GET


| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id  | integer | *(Required)*  |

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	

If failfull, you will get:

	Status Code: 422 - Unprocessable Entity
	
### Delete

A user is able to delete journeys

**URL** journeys/:journey_id", to: "journeys#destroy"

**Method** DESTROY


| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id  | integer | *(Required)*  |

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	

If failfull, you will get:

	Status Code: 422 - Unprocessable Entity
	
	

	

	



