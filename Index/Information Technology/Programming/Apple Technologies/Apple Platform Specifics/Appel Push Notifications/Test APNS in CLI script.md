- [Apple Developer Documentation](https://developer.apple.com/documentation/usernotifications/sending_push_notifications_using_command-line_tools)

Script to send push notifications directly to apns from ‣ to test it

```bash
TEAM_ID=""
TOKEN_KEY_FILE_NAME="*.p8"
AUTH_KEY_ID=""
TOPIC="com.myapp.app" # app bundle
DEVICE_TOKEN="" # device apns token
APNS_HOST_NAME="api.push.apple.com" # env to test on

JWT_ISSUE_TIME=$(date +%s)
JWT_HEADER=$(printf '{ "alg": "ES256", "kid": "%s" }' "${AUTH_KEY_ID}" | openssl base64 -e -A | tr -- '+/' '-_' | tr -d =)
JWT_CLAIMS=$(printf '{ "iss": "%s", "iat": %d }' "${TEAM_ID}" "${JWT_ISSUE_TIME}" | openssl base64 -e -A | tr -- '+/' '-_' | tr -d =)
JWT_HEADER_CLAIMS="${JWT_HEADER}.${JWT_CLAIMS}"
JWT_SIGNED_HEADER_CLAIMS=$(printf "${JWT_HEADER_CLAIMS}" | openssl dgst -binary -sha256 -sign "${TOKEN_KEY_FILE_NAME}" | openssl base64 -e -A | tr -- '+/' '-_' | tr -d =)
AUTHENTICATION_TOKEN="${JWT_HEADER}.${JWT_CLAIMS}.${JWT_SIGNED_HEADER_CLAIMS}"

curl -v --header "apns-topic: $TOPIC" \
  --header "apns-push-type: alert" \
  --header "authorization: bearer $AUTHENTICATION_TOKEN" \
  --data '{"aps":{"alert":"Hi!"}}' \
  --http2 https://${APNS_HOST_NAME}/3/device/${DEVICE_TOKEN}
```