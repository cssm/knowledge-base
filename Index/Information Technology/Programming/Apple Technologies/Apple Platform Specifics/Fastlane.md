
- **Links**
	- [fastlane/fastlane: 🚀 The easiest way to automate building and releasing your iOS and Android apps](https://github.com/fastlane/fastlane)
	- [ios-mail/Fastfile at master · ProtonMail/ios-mail](https://github.com/ProtonMail/ios-mail/blob/master/ProtonMail/fastlane/Fastfile)
- **Notes**	
	- `Env` variables are mapped to lane calls, i.e.
	- So basically rule works for every lane just `LANE_NAME + _PARAM_NAME`
	- march - provision profile, certificates, private keys (`.p12`) in repo
	- `cert` + `sigh` - auto managing new certs (need admin rights to app store connect)
	- `cert` - generating certificates `sigh` - generating provision profiles
	```ruby
	# 🛑
	lane :beta do
		crashlytics(api_token: "123abc", build_secret: "secret_key")
	end
	```

	```bash
	// ✅
	export CRASHLYTICS_API_TOKEN="123abc"
	export CRASHLYTICS_BUILD_SECRET="secret_key"
	```
	```ruby
	lane :beta do
		crashlytics
	end
	```