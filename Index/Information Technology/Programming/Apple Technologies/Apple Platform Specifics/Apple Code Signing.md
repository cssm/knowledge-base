-  *[Fastlane](Fastlane.md)*
	- Env variables are mapped to lane calls, i.e.
	- So basically rule works for every lane just `LANE_NAME + _PARAM_NAME`
	- march - provision profile, sertivicates, provate keys (.p12) in repo
	- cert + sigh - auto managing new certs (need admin rights to app store connect)
	- cert - generating cetrificates sigh - generating provision profiles

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
- **Code signing algorithm**

	Certificates - about identifying you as developer

	Provision profiles - about your app

	Entitlements - whites list of stuff that app need to access (iCloud, Notifications etc.)

	There’re two kinds of certificates:

	- Development (for developer to sign apps)
	- Distribution (for distributing apps to App Store Connect)

	Every target should be sign with one certificate (i.e. target1 app id: com.app.app1, target2 app id: com.app.app2 so you should have two profiles for this bundle ids or profile with wildcard id com.app.*)

> YOU CAN’T GENERATE IPA FOR x86 (to use drag-and-drop in Simulator just get .app from Products folder of your app)

> A team provisioning profile is downloaded from your developer account and embedded in the app bundle, and the entire bundle is code-signed.

![[Apple Code signing/Team_Provisioning_Profile.png]]

Dev provision profile - will run with dev certificates included in this profile

Distribution profile - do not specify any device IDs

Distribution Profiles is used to submit app to the App Store for distribution. After the app is reviewed by apple they sign in the app with their own signature that can run on any device

Ad-Hoc profile - only for specified set of device IDs

If all the above steps are successful the **signed binary is sent** to the device and is **validated** against the **same provisioning profile** in the app and finally **launched**.

![[Apple Code signing/1YqhNRf3-OE5DZ5j_yyYeog.png]]

1. **Xcode** will be installed and the **Intermediate Certificate** will be pushed into the Keychain
2. **Certificate Signing Request (CSR)** will be created.
3. **Private Key** will be generated along the **CSR** creation and stored in the Keychain
4. **CSR** will be uploaded to the Member Center
5. Apple will proof everything and issue the **Certificate**
6. **Certificate** will be downloaded to your Computer
7. The **Certificate** will be pushed into the Keychain and paired with the private key to form the **Code Signing Identity**
8. The **Provisioning Profile** will be created using a  and downloaded by **Xcode**
    
    Certificate, App ID and Device Identifiers
    
9. **Xcode** will sign the App and push **Provisioning Profiles** onto the Device
10. **iOS** will proof if everything is correctly configured.That means that the **Provisioning Profile** should include the **Certificate** you used to sign the App, your **Device UDID** and the correct **App ID**.
11. Your App should be running now!