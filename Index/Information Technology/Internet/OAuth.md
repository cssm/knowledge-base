# OAuth

## Tokens

**Bearer token (access token)** - used for accessing API (sends in header of HTTP request)

**Refresh token**  - used to get new access token (gained for one sign in session i.e. if expiers we need to re-sign in)

### JWT ([[JSON]] Web Token)

`base64url` encoded token with **header**, **payload** and **signature**

**Header** - contains info about algorithm with which signature is encoded

**Payload** - contains custom information. For example `sub` which uniquely identifies client

**Signature** - `SHA256(secret, base64urlEncoding(header) + '.' + base64urlEncoding(payload))`

```
base64urlEncoding(header) + '.' + base64urlEncoding(payload) + '.' + base64urlEncoding(signature)
```

[JWT.IO](https://jwt.io)

## Security

To secure server from sending stolen request we have concept of **nonce** and **time** **stamp.** 

**Nonce** is uniquely generated code to check if this request was already send 

**Timestamp** is used to determinate when request was send. 

Nonce and timestamp should be a part of signature

Server can not store all timestamps to check if request is valid. It can just check that request timestamp in some acceptable range. Range should be not to big (if it will hackers can have time to send request with same nonce ) and not to small (delays in sending requests through internet still exist)