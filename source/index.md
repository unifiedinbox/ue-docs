---
title: API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='http://dev.unifiedinbox.com/register'>Sign Up for a Developer Key</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the UnificationEngine™ API! You can use our API to access UnificationEngine™ API endpoints, which can communicate with various connectors. You can even create a connector and link it with UnificationEngine™ in the developer portal.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


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

## Send message

```shell
curl -XPOST https://accesskey:secret@uib-api/v2/message/send --data '{
   "message": {
   "receivers": [
   {"address":"karl","connector":"facebookaccount1"},
   {"address":"otto","connector":"twitteraccount2"}
   ],
   "parts": [
   {"id":"0","ContentType":"text/plain","Type":"body","data":"My test message",size:"15"}
   ]
   }
  }'
```

> The above command returns JSON structured like this:

```json
[
  queued: 2
]

```

This endpoint retrieves sends messages.

### HTTP Request

`POST https://accesskey:secret@uib-api/v2/message/send`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
message | null | example json message {"receivers": [{"address":"karl","connector":"facebookaccount1"},{"address":"otto","connector":"twitteraccount2"}],"parts": [{"id":"0","ContentType":"text/plain","Type":"body","data":"My test message",size:"15"}]}}```


<aside class="success">
Remember — API requires authentication!
</aside>

