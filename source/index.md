---
title: API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='http://developer.unificationengine.com/register'>Sign Up for a Developer Key</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome  to the UnificationEngine™ API! You can use our API to access UnificationEngine™ API endpoints, which can communicate with various connectors, such as Facebook, Twitter, LinkedIn, Xing, Weibo and more. You can even create your own connector and link it with UnificationEngine™ in the developer portal.

You can view code examples in the dark area to the right.


# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl -H "Content-Type: application/json" --data "{}" -k https://yourapikey:yourapisecret@apiv2.unificationengine.com/
```

> Make sure to replace `yourapikey:yourapisecret` with your API key and Secret.

UnificationEngine™ uses API keys to allow access to the API. You can register a new UnificationEngine™ app API key at our [developer portal](http://developer.unificationengine.com).

UnificationEngine™ expects for the API key and Secret to be included in all API requests to the server. The endpoint URL will look like this:

`https://yourapikey:yourapisecret@apiv2.unificationengine.com/`


![alt tag](/images/appDetails.png)


<aside class="notice">
You must replace <code>yourapikey:yourapisecret</code> with your personal app API key and secret that you have created in developer portal.
</aside>


# Create app
	
	Select "Create app" option from dropdown and create the app by enter the app name.
	After creating app the user will get an app key and and secret.

![alt tag](/images/createApp.png)


# Add Connector to an app
	
	Choose a connector from the connectors list and click next button and provide app key and secret. If your app does not have any key and secret, just key in them as "no_key" and "no_secret" respectively and press next button and finally click the submit button for adding the connector.

![alt tag](/images/addConnector.png)

	

# UnificationEngine™


## Create user

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/user/create -u 8481eeb9c8304ce0a5e3cb58489868f4:4cc366b8be84a072d9232b7db7329c30 --data '{}'
```

> The above command returns a JSON structured like this:

```json

  {
   "status": 200,
   "info": "OK",
   "uri":"user://e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@"
  }

```

This endpoint will create a UnificationEngine™ user for the developer's app. This user is required for adding the connections like facebook, twitter etc.

"yourapikey" and "yourapisecret" will get from 

![alt tag](/images/appDetails.png) 

The user should be created with the key and secret of the app. On successful creation of a user, a uri containing the access key and the secret for the user will be returned as response, which is required for all further api calls. The uri will be in the format "user://access_key:secret@".

The command for creating user is

curl -XPOST https://apiv2.unificationengine.com/v2/user/create -u yourapikey:yourapisecret –data '{}' -k

Response data:
{"status":200,"info":"200 OK","uri":"
user://USER_ACCESSKEY:USER_ACCESSSECRET"}

### HTTP Request

`POST https://yourapikey:yourapisecret@uib-api/v2/user/create`

<aside class="notice">
You must replace <code>yourapikey:yourapisecret</code> with your personal app API key and secret that you have created in developer portal.
</aside>


### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
uri   | string  | user://e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@

### Error


Error code        |  Meaning 
--------- | ------- | -----------
1000| Internal Error 

<aside class="success">
Remember — the API requires authentication!
</aside>


## Delete user

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/user/delete -u 8481eeb9c8304ce0a5e3cb58489868f4:4cc366b8be84a072d9232b7db7329c30 --data '{"uri":"user://e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@"}
```

> The above command returns JSON structured like this:

```json

  {
   "status": 200,
   "info": "OK"
  }


```

This endpoint will delete the user for the app, specified in the uri parameter.
This api call should be authenticated with the key and secret of the app.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/user/delete`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
uri | null | user://e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@	

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK


### Error


Error code        |  Meaning 
--------- | ------- | -----------
1000| Internal Error
505| Request contains errors
414| User not found

<aside class="success">
Remember — the API requires authentication!
</aside>



## List users

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/user/list -u 8481eeb9c8304ce0a5e3cb58489868f4:4cc366b8be84a072d9232b7db7329c30 --data '{}'
```

> The above command returns JSON structured like this:

```json

 {
   "status": 200,
   "info": "OK",
   "users":[{"uri":"user://e9759590-54ef-4cd3-a01c-cb2241ddd812@"}]
 }


```

This endpoint will list all the users created for the app.
This api call should be authenticated with the key and secret of the app.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/user/list`

### Query Parameters

None.

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
users | json    | [{"uri":"user://e9759590-54ef-4cd3-a01c-cb2241ddd812@"}]

### Error


Error code        |  Meaning 
--------- | ------- | -----------
1000| Internal Error

<aside class="success">
Remember — the API requires authentication!
</aside>



## Add connection

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/connection/add -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b --data '{"uri":"facebook://CAADJsdsdds00BAAPX5siAhzZCUZBOGD2pFJngc2wGDb7RRyUzvYVe5EAT5fUvZAmB4OYpmcPPiHzsJJ8zLUYTgGhjBKOOsa0wj5kTBXWXWKOxrCrGp4uLL48CkkMNjmmTPlEirOOwSlKiX4VV2yfmoRgDZBQ9MsFC5yZC4xDL9YrdedTZBQpFN2@facebook.com","name":"facebook"}'
```

> The above command returns JSON structured like this:

```json

 {
   "status": 200,
   "info": "OK"
  }


```

This endpoint will add a connection to the user of the app.
A connection is an authenticated instance of a connector.
A connector, which has to be added in the developer portal, is a bridge between the service and the app.
A service can be anything like Facebook, Twitter etc.
The uri parameter part for this api call consists of three parts:
* Connector identifier (scheme of uri)
* Service access token
* Service domain name
The "name" parameter is used to identify the connection for the user, which is required for the further api calls using this connection.
Once a connection is successfully added, it can be identified by using the "name" as "unified://name".
This api call should be authenticated with the key and secret of the user.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/connection/add`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
 uri| null | 	{"uri":"facebook://CAADJsdsdds00BAAPX5siAhzZCUZBOGD2pFJngc2wGDb7RRyUzvYVe5EAT5fUvZAmB4OYpmcPPiHzsJJ8zLUYTgGhjBKOOsa0wj5kTBXWXWKOxrCrGp4uLL48CkkMNjmmTPlEirOOwSlKiX4VV2yfmoRgDZBQ9MsFC5yZC4xDL9YrdedTZBQpFN2@facebook.com"}
 name|null|facebook

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK


### Error


Error code        |  Meaning 
--------- | ------- | -----------
1000| Internal Error 
413| Connector not found

<aside class="success">
Remember — the API requires authentication!
</aside>

## Test connection

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/connection/test -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b --data '{"uri":"facebook://CAADJsdsdds00BAAPX5siAhzZCUZBOGD2pFJngc2wGDb7RRyUzvYVe5EAT5fUvZAmB4OYpmcPPiHzsJJ8zLUYTgGhjBKOOsa0wj5kTBXWXWKOxrCrGp4uLL48CkkMNjmmTPlEirOOwSlKiX4VV2yfmoRgDZBQ9MsFC5yZC4xDL9YrdedTZBQpFN2@facebook.com"}'
```

> The above command returns JSON structured like this:

```json

  
  { 
   "status": 200,
   "info": "OK"
  }


```

This endpoint will validate the access token of the service.
This api call should be authenticated with the key and secret of the user.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/connection/test`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
 uri| null | 	{"uri":"facebook://CAADJsdsdds00BAAPX5siAhzZCUZBOGD2pFJngc2wGDb7RRyUzvYVe5EAT5fUvZAmB4OYpmcPPiHzsJJ8zLUYTgGhjBKOOsa0wj5kTBXWXWKOxrCrGp4uLL48CkkMNjmmTPlEirOOwSlKiX4VV2yfmoRgDZBQ9MsFC5yZC4xDL9YrdedTZBQpFN2@facebook.com"}

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK


### Error


Error code        |  Meaning 
--------- | ------- | -----------
413| Connector not found

<aside class="success">
Remember — API requires authentication!
</aside>




## Connection info

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/connection/info -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b --data '{\"uri\":\"unified://facebook\"}'
```

> The above command returns JSON structured like this:

```json

 {
  "status": 200,
  "info": "OK",
  "connections":[{"connector":"","displayName":"Test User","loginName":"test_user","userImage":"https://scontent.xx.fbcdn.net/hprofile-xpa1/v/t1.0-1/p50x50/12115793_446283435581473_4214911104650919033_n.jpg?oh=0a7f3f50972f82a14828393b6b893a31&oe=56F0A755"}]
  }


```

This endpoint will list information about the connectors.
This api call should be authenticated with the key and secret of the user.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/connection/info`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
 uri| null | 	{\"uri\":\"unified://facebook\"}

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
connections| json| [{"connector":"","displayName":"Test User","loginName":"test_user","userImage":"https://scontent.xx.fbcdn.net/hprofile-xpa1/v/t1.0-1/p50x50/12115793_446283435581473_4214911104650919033_n.jpg?oh=0a7f3f50972f82a14828393b6b893a31&oe=56F0A755"}]

### Error


Error code        |  Meaning 
--------- | ------- | -----------
411| Connection not found

<aside class="success">
Remember — the API requires authentication!
</aside>




## Connection refresh

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/connection/refresh -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b --data '{\"uri\":\"unified://facebook\"}'
```

> The above command returns JSON structured like this:

```json

  {
   "status": 200,
   "info": "OK",
   "uri":"faceboo://CAADJarduul3lZCP2s@facebook.com"
  }


```

In some services the access token has a short lifespan and another api has to be made to get a long lifespan access token. For example, Facebook first gives an access token with a short lifespan. Once we refresh the api access token, we will get another access token with a longer life.
This api call should be authenticated with the key and secret of the user.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/connection/refresh`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
 uri| null | 	{\"uri\":\"unified://facebook\"}

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
uri  | string  | faceboo://CAADJarduul3lZCP2s@facebook.com


### Error


Error code        |  Meaning 
--------- | ------- | -----------
411| Connection not found


<aside class="success">
Remember — the API requires authentication!
</aside>


## Remove connection

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/connection/remove -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b --data '{"name":"facebook"}'
```

> The above command returns JSON structured like this:

```json

 {
  "status": 200,
  "info": "OK"
 }


```

This endpoint will remove a connection of a user.
This api call should be authenticated with the key and secret of the user.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/connection/remove`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
 name|null|facebook

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK


### Error


Error code        |  Meaning 
--------- | ------- | -----------
1000| Internal Error 
411| Connection not found

<aside class="success">
Remember — the API requires authentication!
</aside>





## List connection

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/connection/list -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b --data '{}'
```

> The above command returns JSON structured like this:

```json

  {
   "status": 200,
   "info": "OK",
   "connections":["facebook":{"uri":"facebook://CAADJsdsdds00BAAPX5siAhzZCUZBOGD2pFJngc2wGDb7RRyUzvYVe5EAT5fUvZAmB4OYpmcPPiHzsJJ8zLUYTgGhjBKOOsa0wj5kTBXWXWKOxrCrGp4uLL48CkkMNjmmTPlEirOOwSlKiX4VV2yfmoRgDZBQ9MsFC5yZC4xDL9YrdedTZBQpFN2@facebook.com"}]
  }


```

This endpoint will list all the connections of the user.
This api call should be authenticated with the key and secret of the user.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/connection/list`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
connections|json |"facebook":{"uri":"facebook://CAADJsdsdds00BAAPX5siAhzZCUZBOGD2pFJngc2wGDb7RRyUzvYVe5EAT5fUvZAmB4OYpmcPPiHzsJJ8zLUYTgGhjBKOOsa0wj5kTBXWXWKOxrCrGp4uLL48CkkMNjmmTPlEirOOwSlKiX4VV2yfmoRgDZBQ9MsFC5yZC4xDL9YrdedTZBQpFN2@facebook.com"}

### Error


Error code        |  Meaning 
--------- | ------- | -----------
1000| Internal Error 


<aside class="success">
Remember — the API requires authentication!
</aside>




## Send message

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/message/send  --data "{ \"message\": { \"receivers\": [{\"name\": \"Me\", \"address\": \"test.test\" , \"Connector\": \"facebook\" }],\"subject\":\"test\",\"parts\": [{\"id\": \"0\", \"contentType\": \"binary\" , \"size\": 2211,\"type\": \"image_link\", \"name\":\"file name\",\"data\":\"http://www.hd-wallpapersdownload.com/upload/bulk-upload/desktop-pictures-of-cute-kittens-and-cats-wallpaper.jpg\",\"sort\":1},{\"id\": \"1\",\"contentType\": \"text/plain\", \"data\":\"test\" ,\"size\": 100,\"type\": \"body\",\"sort\":0}, {\"id\": \"2\",\"contentType\": \"text/plain\", \"data\":\"description2\" ,\"size\": 100,\"type\": \"link_description\",\"sort\":2},{\"id\": \"3\",\"contentType\": \"text/plain\", \"data\":\"title2\" ,\"size\": 100,\"type\": \"link_title\",\"sort\":3},{\"id\": \"4\",\"contentType\": \"text/plain\", \"data\":\"http://www.amt.in\" ,\"size\": 100,\"type\": \"link\",\"sort\":4}]}}" -u f68a8efd-dc55-405d-b1f0-b4433477d52a:43093a7d-f563-43a7-8e46-56791cb1b92f
```

> The above command returns JSON structured like this:

```json

  {
   "status": 200,
   "info": "OK",
   "URIs" :"facebook://facebook.com/648738109689982977"
  }


```

This endpoint will send a message to services like Twitter, Facebook etc.
It's possible to send messages to multiple services using a single api call. The contentType in the 'part' parameter should be one of the connector capabilities, which can be seen when adding the connector to your app.
This api call should be authenticated with the key and secret of the user.

The "type" available in message parts are image_link, body, link, link_description, link_title, tags and image


The steps for sending messages 

First we have to create a user using UE_APPKEY and UE_APPSECRET.

The command for creating user is 

curl -XPOST https://apiv2.unificationengine.com/v2/user/create -u UE_APPKEY:UE_APPSECRET --data '{}' -k

Response data:
{"status":200,"info":"200 OK","uri":"
user://USER_ACCESSKEY:USER_ACCESSSECRET"}

For any further requests,  the USER_ACCESSKEY and  USER_ACCESSSECRET from the response of the above command should be used.



The command for creating a smtp connection

curl -XPOST https://apiv2.unificationengine.com/v2/connection/add -u
USER_ACCESSKEY:USER_ACCESSSECRET --data
'{"uri":"UE_SMTP_CONNECTOR_SCHEME:
//EMAIL_ADDRESS:
PASSWORD@SMTP_HOST:SMTP_PORT",
"name":"UNIQUE_CONNECTION_IDENTIFIER"}' -k


For gmail connection we have to enable less secure apps access in gmail. https://www.google.com/settings/security/lesssecureapps


The command for creating facebook connection

curl -XPOST
https://apiv2.unificationengine.com/v2/connection/add -u
USER_ACCESSKEY:USER_ACCESSSECRET --data
'{"uri":"UE_FB_CONNECTOR_SCHEME:
//FACEBOOK_ACCESS_TOKEN@facebook.com",
"name":"UNIQUE_CONNECTION_IDENTIFIER"}' -k


If you are using a connector that already exists in UE, you can get UE_SMTP_CONNECTOR_SCHEME, UE_FB_CONNECTOR_SCHEME etc  from "Scheme to be used in the API", from  the connector details in app.



![alt tag](/images/connectorDetails.png)




Please replace the above uri parameters with your own details. The "name" parameter should be unique. This will be used to identify the connection on execution of other commands like "message/send", "connection/info" etc.


The command for sending emails

curl -XPOST https://apiv2.unificationengine.com/v2/message/send   --data "{ \"message\": { \"receivers\": [{\"name\": \"TO_NAME \", \"address\": \"TO_EMAILADDRESS\" , \"Connector\": \"UNIQUE_CONNECTION_IDENTIFIER\", \"type\": \"to\"}],\"sender\": {\"address\": \"EMAIL_ADDRESS\"},\"subject\":\"Hello\",\"parts\": [{\"id\": \"1\",\"contentType\": \"text/plain\", \"data\":\"Hi welcome to UE\" ,\"size\": 100,\"type\": \"body\",\"sort\":0}]}}" -u USER_ACCESSKEY:USER_ACCESSSECRET -k




### HTTP Request

`POST https://accesskey:secret@uib-api/v2/message/send`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
message|null|{ \"receivers\": [{\"name\": \"Me\", \"address\": \"test.test\" , \"Connector\": \"facebook\" }],\"subject\":\"test\",\"parts\": [{\"id\": \"0\", \"contentType\": \"binary\" , \"size\": 2211,\"type\": \"image_link\", \"name\":\"file name\",\"data\":\"http://www.hd-wallpapersdownload.com/upload/bulk-upload/desktop-pictures-of-cute-kittens-and-cats-wallpaper.jpg\",\"sort\":1},{\"id\": \"1\",\"contentType\": \"text/plain\", \"data\":\"test\" ,\"size\": 100,\"type\": \"body\",\"sort\":0}, {\"id\": \"2\",\"contentType\": \"text/plain\", \"data\":\"description2\" ,\"size\": 100,\"type\": \"link_description\",\"sort\":2},{\"id\": \"3\",\"contentType\": \"text/plain\", \"data\":\"title2\" ,\"size\": 100,\"type\": \"link_title\",\"sort\":3},{\"id\": \"4\",\"contentType\": \"text/plain\", \"data\":\"http://www.amt.in\" ,\"size\": 100,\"type\": \"link\",\"sort\":4}]}

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
URIs |array|facebook://facebook.com/648738109689982977


### Error


Error code        |  Meaning 
--------- | ------- | -----------
410| No receivers specified
411| Connection not found
415|Feature not supported by connector


<aside class="success">
Remember — the API requires authentication!
</aside>


## Retrieve message

```shell
curl -XPOST https://apiv2.unificationengine.com/v2/message/retrieve -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b --data '{\"uri\":\"unified://twitter\"}'
```

> The above command returns JSON structured like this:

```json

  {
   "status": {"whatsapp":{"status":200,"info":"OK"}},
   "messages":"{"twitter":[{"uri":"inbox/","mid":"https://twitter.com/messages/2373196350-57880525/?id=705303064085827588",
"timestamp":1393996305000,"sender":{"connector":"","name":"dibeesh","address":"https://twitter.com/testamt","uri":""},
"returnPath":{"connector":"","address":"","uri":""},"receivers":[{"connector":"","name":"Test Test","address":"testtest","uri":""}],"subject":"Test message","date":1393996305000,"userAgent":"","headers":null,
"parts":[{"id":"0","contentType":"text/html","type":"body","data":"Test message","size":16,"sort":0}]}]}"
  }


```

This endpoint will retrieve the messages from the services like twitter, whatsapp.
This api call should be authenticated with the key and secret of the user.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/message/retrieve`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
messages|json |{"twitter":[{"uri":"inbox/","mid":"https://twitter.com/messages/2373196350-57880525/?id=705303064085827588","timestamp":1393996305000,"sender":{"connector":"","name":"dibeesh","address":"https://twitter.com/testamt","uri":""},"returnPath":{"connector":"","address":"","uri":""},"receivers":[{"connector":"","name":"Test Test","address":"testtest","uri":""}],"subject":"Test message","date":1393996305000,"userAgent":"","headers":null,"parts":[{"id":"0","contentType":"text/html","type":"body","data":"Test message","size":16,"sort":0}]}]}

### Error


Error code        |  Meaning 
--------- | ------- | -----------
1000| Internal Error 


<aside class="success">
Remember — the API requires authentication!
</aside>


# Connector

## Connectors

Welcome to the Connector!
A connector, which has to be added in the developer portal is a bridge between the service and the app.
A service can be anything like facebook, twitter etc.

### Steps to add a connector to an app in the developer portal.
Choose a connector from the list available and key in a connector key and secret and click submit. If your app does not have any key and secret, just key in them as "no_key" and "no_secret" respectively.

### A connector contains
### 1. Endpoint
The endpoint is where the Unification Engine can connect to call the connector.
### 2. Capabilities
A connector can have the following capabilities

* Sending
* Receiving
* Folders
* Push
* Delete
* Contacts
* Flags
* Stats
* Binary
* Image
* Video
* HTML
* Plain

### 3. Timeout (ms)
The timeout is the time in milliseconds, after which the Unified Engine considers the api call have failed.
### 4. Scheme
Schemes specifying a concrete syntax and associated protocols define each URI. Scheme should contain only alphabets and numerals without any spaces.
The format of URI is "scheme:[//[user:password@]domain[:port]][/]path".
You can see an example for URI on the right side.

```shell
curl -H "Content-Type: application/json" https://a2db9638d11646d282885e8f2f72fabb:3c02ec16f14ad5ec4cf9b8dafd3d81c8@twitter-connector/v2/test --data "{\"uri\":\"twitter://57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY@twitter.com\", \"apiToken\":\"5B1fn6KFFsABk3ffZMPxRTLcg:DzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNYcM6jPgk\"}" -k
```

### 5. Name
The name of the connector, which should be unique.
### 6. Accesskey and Secret
Client id(Accesskey) and Client secret(Secret) used for authenticating the api calls to service (facebook, twitter etc). Every call to connector will have a  parameter, apiToken=Accesskey:Secret.

## Authentication

Every call to connector will have an http basic auth using the connector accesskey and secret.



## Test connection

This endpoint will validate the accesstoken of the service of a user.
The test connection will be invoked upon adding a connection for a user in UE. Only upon successfull response, a connection will be added in UE.


Example for adding connection with parameters

curl -H "Content-Type: application/json"
https://CONNECTOR_KEY:
CONNECTOR_SECRET@CONNECTOR
_ENDPOINT/v2/test
--data "{\"uri\":\"CONNECTOR_SCHEMA:
//SERVICE_ACCESS_TOKEN:
SERVICE_ACCESS_SECRET@CONNECTOR.com\",
\"apiToken\":\"SERVICE_OAUTH_KEY:SERVICE_OAUTH
_SECRET\"}" -k



```shell
curl -H "Content-Type: application/json" https://a2db9638d11646d282885e8f2f72fabb:3c02ec16f14ad5ec4cf9b8dafd3d81c8@twitter-connector/v2/test --data "{\"uri\":\"twitter://57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY@twitter.com\", \"apiToken\":\"5B1fn6KFFsABk3ffZMPxRTLcg:DzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNYcM6jPgk\"}" -k
```

> The above command returns JSON structured like this:

```json

{
"status": 200,
"info": "OK"
}


```

### Query Parameters

The uri parameter part for this api call consists of three part
1. Connector identifier (scheme of uri)
2. Service accesstoken
3. Service domain name

Parameter | Default | Description
--------- | ------- | -----------
uri| null | 	twitter://57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY@twitter@twitter.com
apiToken|null|5B1fn6KFFsABk3ffZMPxRTLcg:DzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNYcM6jPgk

### Response


|         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK


### Error


Error code        |  Meaning
--------- | ------- | -----------
503| Invalid access credentials

<aside class="success">
    Remember — Protect the API with authentication!
</aside>



## Connection info

This endpoint will list connector's info including the display name and profile image of the service.

Example for getting connection info with parameters

curl -H "Content-Type: application/json" https://CONNECTOR_KEY:CONNECTOR_SECRET@
CONNECTOR_ENDPOINT/v2/connector/connectionInfo
--data "{\"uri\":\"CONNECTOR_SCHEMA:
//SERVICE_ACCESS_TOKEN:
SERVICE_ACCESS_SECRET@CONNECTOR.com\",
\"apiToken\":\"SERVICE_OAUTH_KEY:
SERVICE_OAUTH_SECRET\"}" -k



```shell
curl -H "Content-Type: application/json" https://a2db9638d11646d282885e8f2f72fabb:3c02ec16f14ad5ec4cf9b8dafd3d81c8@twitter-connector/v2/connector/connectionInfo --data "{\"uri\":\"twitter://57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY@twitter.com\", \"apiToken\":\"5B1fn6KFFsABk3ffZMPxRTLcg:DzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNYcM6jPgk\"}" -k
```

> The above command returns JSON structured like this:

```json

{
"status": 200,
"info": "OK",
"connections":[{"displayName":"test user","loginName":"test_user","userImage":"http://pbs.twimg.com/profile_images/378800000658702791/68493e28324e71981790c04d5705cbb4_normal.png"}]
}


```

### Query Parameters

The uri parameter part for this api call consists of three part
1. Connector identifier (scheme of uri)
2. Service accesstoken
3. Service domain name

Parameter | Default | Description
--------- | ------- | -----------
uri| null | 	twitter://57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY@twitter.com
apiToken|null|5B1fn6KFFsABk3ffZMPxRTLcg:DzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNYcM6jPgk

### Response


|         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
connections| json| [{"displayName":"test user","loginName":"test_user","userImage":"http://pbs.twimg.com/profile_images/378800000658702791/68493e28324e71981790c04d5705cbb4_normal.png"}]


<aside class="success">
    Remember — Protect the API with authentication!
</aside>





## Connection refresh

In some services the accesstoken has short lifespan and another api has to be called to get an accesstoken withlong lifespan. for example facebook first gives an accesstoken with short lifespan. Once we refresh the api accesstoken we will get another accesstoken with long life.

Example for refreshing connection with parameters

curl -H "Content-Type: application/json" https://CONNECTOR_KEY:CONNECTOR_SECRET@
CONNECTOR_ENDPOINT/v2/connector/refresh
--data "{\"uri\":\"CONNECTOR_SCHEMA:
//SERVICE_ACCESS_TOKEN:
SERVICE_ACCESS_SECRET@CONNECTOR.com\",
\"apiToken\":\"SERVICE_OAUTH_KEY:SERVICE_OAUTH
_SECRET\"}" -k



```shell
curl -H "Content-Type: application/json" https://22db9638d11646d282885e8f2f72fabb:4c02ec16f14ad5ec4cf9b8dafd3d81c8@facebook-connector/v2/connector/refresh --data "{\"uri\":\"facebook://CAwAZDZD@facebook.com\", \"apiToken\":\"6B1fn6KFFsABk3ffZMPxRTLcg:EzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNYcM6jPgk\"}" -k
```

> The above command returns JSON structured like this:

```json

{
"status": 200,
"info": "OK"
"uri":"facebook://DBBJarduu51GPsRUxuTYZD@facebook.com"
}


```

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
uri| null | facebook://CAwAZDZD@facebook.com
apiToken|null | 6B1fn6KFFsABk3ffZMPxRTLcg:EzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNYcM6jPgk



### Response

|         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
uri| null | facebook://DBBJarduu51GPsRUxuTYZD@facebook.com


### Error


status| Error code        |  Meaning
--------- | ------- | -----------
status|503| Invalid access credentials

<aside class="success">
    Remember — Protect the API with authentication!
</aside>



## Send message

This endpoint will send messages to services like twitter, facebook etc.
We can send messages to multiple services using single api call. The contentType in the 'part' parameter, should be one of the capabilities chosen for the connector.


The "type" available in message parts are image_link, body, link, link_description, link_title, tags and image


Example for sending messages with parameters

curl -H "Content-Type: application/json"
https://CONNECTOR_KEY:CONNECTOR_SECRET@
CONNECTOR_ENDPOINT/v2/message/send --data
"{\"uri\":\"twitter://57880525-4GR3YESZdVCBMTV0DHXz7
nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL
4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY
@twitter.com\",
\"apiToken\":\"5B1fn6KFFsABk3ffZMPxRTLcg:
DzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNY
cM6jPgk\",
\"message\":{\"uri\":\"\",\"mid\":\"\",\"timestamp\":0,
\"sender\":{\"connector\":\"\",
\"address\":\"\",\"uri\":\"\"},
\"returnPath\":{\"connector\":\"\",
\"address\":\"\",\"uri\":\"\"},
\"receivers\":[{\"connector\":\"twitter\",
\"name\":\"name\",\"address\":\"testuser\",
\"uri\":\"\"}],\"date\":0,\"userAgent\":\"\",
\"headers\":null,\"parts\":[{\"id\":\"1\",
\"contentType\":\"image/gif\",\"type\":\"image_link\",
\"name\":\"file name\",
\"data\":\"http://www.freedigitalphotos.net/
images/img/homepage/87357.jpg\",
\"size\":2211,\"sort\":5},
{\"id\":\"1\",\"contentType\":\"text/plain\",
\"type\":\"body\",\"data\":\"content\",\"size\":100,
\"sort\":0}]}}"


```shell
curl -H "Content-Type: application/json" https://a2db9638d11646d282885e8f2f72fabb:3c02ec16f14ad5ec4cf9b8dafd3d81c8@twitter-connector/v2/message/send --data "{\"uri\":\"twitter://57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY@twitter.com\",\"apiToken\":\"5B1fn6KFFsABk3ffZMPxRTLcg:DzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNYcM6jPgk\",\"message\":{\"uri\":\"\",\"mid\":\"\",\"timestamp\":0,\"sender\":{\"connector\":\"\",\"address\":\"\",\"uri\":\"\"},\"returnPath\":{\"connector\":\"\",\"address\":\"\",\"uri\":\"\"},\"receivers\":[{\"connector\":\"twitter\",\"name\":\"name\",\"address\":\"testuser\",\"uri\":\"\"}],\"date\":0,\"userAgent\":\"\",\"headers\":null,\"parts\":[{\"id\":\"1\",\"contentType\":\"image/gif\",\"type\":\"image_link\",\"name\":\"file name\",\"data\":\"http://www.freedigitalphotos.net/images/img/homepage/87357.jpg\",\"size\":2211,\"sort\":5},{\"id\":\"1\",\"contentType\":\"text/plain\",\"type\":\"body\",\"data\":\"content\",\"size\":100,\"sort\":0}]}}"
```

> The above command returns JSON structured like this:

```json

{
"status": 200,
"info": "OK"
"uri":648738109689982977

}


```

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
message|null|{"uri":"","mid":"","timestamp":0,"sender":{"connector":"","address":"","uri":""},"returnPath":{"connector":"","address":"","uri":""},"receivers":[{"connector":"twitter","name":"name","address":"minujose","uri":""}],"date":0,"userAgent":"","headers":null,"parts":[{"id":"1","contentType":"image/gif","type":"image_link","name":"file name","data":"http://www.freedigitalphotos.net/images/img/homepage/87357.jpg","size":2211,"sort":5},{"id":"1","contentType":"text/plain","type":"body","data":"content","size":100,"sort":0}
apiToken|null|5B1fn6KFFsABk3ffZMPxRTLcg:DzL1tgJk5RWeHURbyMjFAQpUVddacjBn9kFbNYcM6jPgk
uri|null| twitter://57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY@twitter.com


### Response

|         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
uri | string | 648738109689982977

### Error


status|Error code        |  Meaning
--------- | ------- | -----------
status| 500|
error|error message|


<aside class="success">
    Remember — Protect the API with authentication!
</aside>





## Retrieve message

This endpoint will retrieve the messages from the services like twitter, whatsapp.


Example for refreshing connection with parameters

curl -H "Content-Type: application/json"
https://CONNECTOR_KEY:CONNECTOR_SECRET@
CONNECTOR_ENDPOINT/v2/message/retrieve
--data "{
    \"uri\":\"CONNECTOR_SCHEMA:
    //SERVICE_ACCESS_TOKEN:
    SERVICE_ACCESS_SECRET@CONNECTOR.com\",
    \"apiToken\":\"SERVICE_OAUTH_KEY:
    SERVICE_OAUTH_SECRET\",
    \"entriesperpage\":1,\"startindex\":\"1\"
}" -k


```shell
curl -H "Content-Type: application/json" https://a2db9638d11646d282885e8f2f72fabb:3c02ec16f14ad5ec4cf9b8dafd3d81c8@twitter-connector/v2/message/retrieve --data "{\"uri\":\"twitter://57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY@twitter.com\",\"apiToken\":\"57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY\",\"entriesperpage\":1,\"startindex\":\"1\"}"
```

> The above command returns JSON structured like this:

```json

{
"status": {"twitter":{"status":200,"info":"OK"}},
"messages":"{"twitter":[{"uri":"inbox/","mid":"https://twitter.com/messages/2373196350-57880525/?id=705303064085827588",
"timestamp":1393996305000,"sender":{"connector":"","name":"dibeesh","address":"https://twitter.com/testamt","uri":""},
"returnPath":{"connector":"","address":"","uri":""},"receivers":[{"connector":"","name":"Test Test","address":"testtest","uri":""}],"subject":"Test message","date":1393996305000,"userAgent":"","headers":null,
"parts":[{"id":"0","contentType":"text/html","type":"body","data":"Test message","size":16,"sort":0}]}]}"
}


```

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
uri| null | twitter://57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY@twitter.com
apiToken|null | 57880525-4GR3YESZdVCBMTV0DHXz7nRJbos65hQ5IH1m0QOk7FfUh0:1RwUrdNIfstHlL4agS2vU2YVkmgh3NDBOPvHn7sKDrKdAkY
entriesperpage|null | 2
startindex|null | 10

### Response

|         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
messages| null | {"twitter":[{"uri":"inbox/","mid":"https://twitter.com/messages/2373196350-57880525/?id=705303064085827588","timestamp":1393996305000,"sender":{"connector":"","name":"dibeesh","address":"https://twitter.com/testamt","uri":""},"returnPath":{"connector":"","address":"","uri":""},"receivers":[{"connector":"","name":"Test Test","address":"testtest","uri":""}],"subject":"Test message","date":1393996305000,"userAgent":"","headers":null,"parts":[{"id":"0","contentType":"text/html","type":"body","data":"Test message","size":16,"sort":0}]}]}


### Error


status| Error code        |  Meaning
--------- | ------- | -----------
status|503| Invalid access credentials

<aside class="success">
    Remember — Protect the API with authentication!
</aside>



# FAQ

## Expiry time for users?

Q: Is there an expiry time for users created with this API?

> A: No, there is no expiry time for users.

## How many users to create?

Q: How to create the users? Should we have 1 user created per client application?

> A: It is up to the app developer to decide whether to use a single user for all its users, or to use a single user for a group, or to create a user for each user in the app. For example, Outbox PRO uses a UnificationEngine user for each team.

## What is the {\“uri\”:\“unified://facebook\”} parameter?

Q: Is there any explanation for the {\“uri\”:\“unified://facebook\”} parameter?

> A: 'facebook' is the connection name that the user has added, and it can be any string. For example:
`curl -XPOST https://apiv2.unificationengine.com/v2/connection/add --insecure -u 26838824-76fc-4b2:19014fd4- --data '{"uri":"facebook://CAADJarduu00BAEA3crCVd@facebook.com","name":"facebook"}'`

## Is the service access token encrypted?

Q: Does the service access token need to be encrypted in any way, when executing 'connection/add'?

> A: No, it should not be encrypted.

## What is the identifier for the connection uri?

Q: What is the identifier that will be used in the connection uri, for the API calls? For Google+ is it google_plus or googleplus?

> A: Once you add connectors under your app in https://developer.unificationengine.com/apps, the identifier will be listed under 'Connectors', at 'Scheme to be used in the API'.
