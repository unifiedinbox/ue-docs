# Errors

<aside class="notice">This error section is stored in a separate file in `includes/_errors.md`. Slate allows you to optionally separate out your docs into many files...just save them to the `includes` folder and add them to the top of your `index.md`'s frontmatter. Files are included in the order listed.</aside>

The Kittn API uses the following error codes:


Error Code | Meaning
---------- | -------
0    | "" -- only used internally
410  | No receivers specified
411  | Connection not found
412  | Bad receivers specified
413  | Connector not found
414  | User not found
415  | Feature not supported by connector
416  | Connector auth failed
417  | Connector returned error
418  | Connection expired
500  | provider Offline
501  | Request URI is not valid
502  | JSON is not valid
503  | JSON does not contain needed fields
504  | Connection Error
505  | Request contains errors
506  | Not Implemented
1000 | Internal Error