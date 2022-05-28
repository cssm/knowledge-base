- **Links**
	- [TN3125: Inside Code Signing: Provisioning Profiles | Apple Developer Documentation](https://developer.apple.com/documentation/technotes/tn3125-inside-code-signing-provisioning-profiles)
	- [TN3126: Inside Code Signing: Hashes | Apple Developer Documentation](https://developer.apple.com/documentation/technotes/tn3126-inside-code-signing-hashes)
	- [TN3127: Inside Code Signing: Requirements | Apple Developer Documentation](https://developer.apple.com/documentation/technotes/tn3127-inside-code-signing-requirements)
- **Notes**
	-  We can use [Fastlane](Fastlane.md) to sign our apps on CI
	- *Code signing algorithm*
		- Certificates - about identifying you as developer
		- Provision profiles - about your app
		- Entitlements - white lists of stuff that app need to access (iCloud, Notifications etc.)
		- There’re two kinds of certificates
			- Development (for developer to sign apps)
			- Distribution (for distributing apps to App Store Connect)
		- Every target should be sign with one certificate (i.e. target1 app id: com.app.app1, target2 app id: com.app.app2 so you should have two profiles for this bundle ids or profile with wildcard id com.app.*)
		> YOU CAN’T GENERATE IPA FOR x86 (to use drag-and-drop in Simulator just get .app from Products folder of your app)
		> A team provisioning profile is downloaded from your developer account and embedded in the app bundle, and the entire bundle is code-signed.
		![](Apple%20Code%20signing/Team_Provisioning_Profile.png)
		- Dev provision profile - will run with dev certificates included in this profile
		- Distribution profile - do not specify any device IDs
		- Distribution Profiles is used to submit app to the App Store for distribution. After the app is reviewed by apple they sign in the app with their own signature that can run on any device
		- Ad-Hoc profile - only for specified set of device IDs
		- If all the above steps are successful the **signed binary is sent** to the device and is **validated** against the **same provisioning profile** in the app and finally **launched**.
		![](Apple%20Code%20signing/1YqhNRf3-OE5DZ5j_yyYeog.png)
		1. **Xcode** will be installed and the **Intermediate Certificate** will be pushed into the Keychain
		2. **Certificate Signing Request (CSR)** will be created.
		3. **Private Key** will be generated along the **CSR** creation and stored in the Keychain
		4. **CSR** will be uploaded to the Member Center
		5. Apple will proof everything and issue the **Certificate**
		6. **Certificate** will be downloaded to your Computer
		7. The **Certificate** will be pushed into the Keychain and paired with the private key to form the **Code Signing Identity**
		8. The **Provisioning Profile** will be created using a  and downloaded by **Xcode** Certificate, App ID and Device Identifiers
		9. **Xcode** will sign the App and push **Provisioning Profiles** onto the Device
		10. **iOS** will proof if everything is correctly configured.That means that the **Provisioning Profile** should include the **Certificate** you used to sign the App, your **Device UDID** and the correct **App ID**.
		11. Your App should be running now!