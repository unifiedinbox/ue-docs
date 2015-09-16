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

Welcome to the UnificationEngine™ API! You can use our API to access UnificationEngine™ API endpoints, which can communicate with various connectors. You can even create a connector and link it with UnificationEngine™ in the developer portal.

You can view code examples in the dark area to the right.


# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl -H "Content-Type: application/json" --data "{}" -k https://yourapikey:yourapisecret@api.unificationengine.com/
```

> Make sure to replace `yourapikey:yourapisecret` with your API key and Secret.

UnificationEngine™ uses API keys to allow access to the API. You can register a new UnificationEngine™ API key at our [developer portal](http://dev.unifiedinbox.com).

UnificationEngine™ expects for the API key and Secret to be included in all API requests to the server that looks like the following:

`https://yourapikey:yourapisecret@api.unificationengine.com/`

<aside class="notice">
You must replace <code>yourapikey:yourapisecret</code> with your personal API key and secret.
</aside>

# UnificationEngine™


## Create user

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/user/create -u 8481eeb9c8304ce0a5e3cb58489868f4:4cc366b8be84a072d9232b7db7329c30 --data '{}'
```

> The above command returns JSON structured like this:

```json

  {
   "status": 200,
   "info": "OK",
   "uri":"user://e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@"
  }

```

This endpoint will create a user for the app, the developer has created in developer portal. This user is created for adding the connections like facebook, twitter etc.
The user should be created with the key and secret of the app. On successful creation of a user, an access key and secret for the user will be returned as response, which is required for all further api calls.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/user/create`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
 |  |

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
Remember — API requires authentication!
</aside>


## Delete user

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/user/delete -u 8481eeb9c8304ce0a5e3cb58489868f4:4cc366b8be84a072d9232b7db7329c30 --data '{"uri":"user://e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@"}
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
Remember — API requires authentication!
</aside>



## List users

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/user/list -u 8481eeb9c8304ce0a5e3cb58489868f4:4cc366b8be84a072d9232b7db7329c30 --data '{}'
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

Parameter | Default | Description
--------- | ------- | -----------
 |  | 	

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
Remember — API requires authentication!
</aside>



## Add connection

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/connection/add -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@ --data '{"uri":"facebook://CAADJsdsdds00BAAPX5siAhzZCUZBOGD2pFJngc2wGDb7RRyUzvYVe5EAT5fUvZAmB4OYpmcPPiHzsJJ8zLUYTgGhjBKOOsa0wj5kTBXWXWKOxrCrGp4uLL48CkkMNjmmTPlEirOOwSlKiX4VV2yfmoRgDZBQ9MsFC5yZC4xDL9YrdedTZBQpFN2@facebook.com","name":"facebook"}'
```

> The above command returns JSON structured like this:

```json

 {
   "status": 200,
   "info": "OK"
  }


```

This endpoint will add a connection to the user of the app.
A connection is an authentication for a connector.
A connector, which has to be added in the developer portal is a bridge between the service and the app.
A service can be anything like facebook, twitter etc.
The uri parameter part for this api call consists of three part
1. Connector identifier (schema of uri)
2. Service accesstoken
3. Service domain name
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
Remember — API requires authentication!
</aside>

## Test connection

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/connection/test -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@ --data '{"uri":"facebook://CAADJsdsdds00BAAPX5siAhzZCUZBOGD2pFJngc2wGDb7RRyUzvYVe5EAT5fUvZAmB4OYpmcPPiHzsJJ8zLUYTgGhjBKOOsa0wj5kTBXWXWKOxrCrGp4uLL48CkkMNjmmTPlEirOOwSlKiX4VV2yfmoRgDZBQ9MsFC5yZC4xDL9YrdedTZBQpFN2@facebook.com"}'
```

> The above command returns JSON structured like this:

```json

  
  { 
   "status": 200,
   "info": "OK"
  }


```

This endpoint will validate the accesstoken of the service.
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
curl -XPOST http://apiv2.unificationengine.com/v2/connection/info -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@ --data '{\"uri\":\"unified://facebook\"}'
```

> The above command returns JSON structured like this:

```json

 {
  "status": 200,
  "info": "OK",
  "connectors":[{"connector":"","displayName":"","loginName":"","userImage":""}]
  }


```

This endpoint will list connectors info.
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
connectors| json| [{"connector":"","displayName":"","loginName":"","userImage":""}]

### Error


Error code        |  Meaning 
--------- | ------- | -----------
411| Connection not found

<aside class="success">
Remember — API requires authentication!
</aside>




## Connection refresh

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/connection/refresh -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@ --data '{\"uri\":\"unified://facebook\"}'
```

> The above command returns JSON structured like this:

```json

  {
   "status": 200,
   "info": "OK"
  }


```

In some services the accesstoken has short lifespan and another api has to be call to get long lifespan accesstoken, for example facebook first gives an accesstoken with short lifespan. Once we refresh the api accesstoken we will get another accesstoken with long life.
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


### Error


Error code        |  Meaning 
--------- | ------- | -----------
411| Connection not found


<aside class="success">
Remember — API requires authentication!
</aside>


## Remove connection

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/connection/remove -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@ --data '{"name":"facebook"}'
```

> The above command returns JSON structured like this:

```json

 {
  "status": 200,
  "info": "OK"
 }


```

This endpoint will remove the connection of a user.
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
Remember — API requires authentication!
</aside>





## List connection

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/connection/list -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@ --data '{}'
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
Remember — API requires authentication!
</aside>



## List address

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/address/list -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@ --data '{"name":"facebook"}'
```

> The above command returns JSON structured like this:

```json

  {
   "status": 200,
   "info": "OK",
   "addresses":[{"connector":"","name":"","address":"","userImage":"","type":""}]
  }


```

This endpoint will list the address.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/address/list`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
uri|null|

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK
addresses|json |[{"connector":"","name,omitempty":"","address":"","userImage,omitempty":"","type,omitempty":""]}


### Error


Error code        |  Meaning 
--------- | ------- | -----------
411| Connection not found

<aside class="success">
Remember — API requires authentication!
</aside>



## Send message

```shell
curl -XPOST http://apiv2.unificationengine.com/v2/message/send -u e9759590-54ef-4cd3-a01c-cb2241ddd812:1aee1a25-e0c4-4036-a8fd-4d41adc8611b@ --data "{ \"message\": { \"receivers\": [{\"name\": \"page\", \"address\": \"117668485005346\" , \"Connector\": \"facebook\" }],\"sender\": {\"address\": \"manu@amt.in\" , \"Connector\": \"facebook\" },\"uri\":\"unified://facebook\",\"subject\":\"test sub 145\",\"parts\": [{\"part\": \"0\", \"contentType\": \"text\/plain\" , \"size\": 31,\"type\": \"body\", \"data\":\"{\u0022image_url\u0022:\u0022http://amt.in/img/amt_logo_big.png\u0022,\u0022preview_title\u0022:\u0022title 1\u0022,\u0022preview_description\u0022:\u0022description 1\u0022,\u0022content\u0022:\u0022content 11\u0022}\"}]},\"uri\":\"unified://facebook\"}"
```

> The above command returns JSON structured like this:

```json

  {
   "status": 200,
   "info": "OK"
  }


```

This endpoint will send messages.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/message/send`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
message|null|[{"uri":"","mid":"","timestamp":"","returnPath,omitempty":"""date":"","userAgent":"","headers":"", \"receivers\": [{\"name\": \"page\", \"address\": \"117668485005346\" , \"Connector\": \"facebook\" }],\"sender\": {\"address\": \"manu@amt.in\" , \"Connector\": \"facebook\" },\"uri\":\"unified://facebook\",\"subject\":\"test sub 145\",\"parts\": [{\"part\": \"0\", \"contentType\": \"text\/plain\" , \"size\": 31,\"type\": \"body\", \"data\":\"{\u0022image_url\u0022:\u0022http://amt.in/img/amt_logo_big.png\u0022,\u0022preview_title\u0022:\u0022title 1\u0022,\u0022preview_description\u0022:\u0022description 1\u0022,\u0022content\u0022:\u0022content 11\u0022}\"}]}]

### Response


          |         |            |
--------- | ------- | -----------
status| integer | 200
info  | string  | OK


### Error


Error code        |  Meaning 
--------- | ------- | -----------
410| No receivers specified
411| Connection not found
415|Feature not supported by connector


<aside class="success">
Remember — API requires authentication!
</aside>