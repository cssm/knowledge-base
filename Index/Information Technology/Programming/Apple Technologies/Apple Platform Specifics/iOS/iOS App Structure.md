# iOS App Structure

![](iOS%20App%20Structure/Untitled.png)

Everything is in a ‣ 

- `ipa` - zip that contains all app info
    - `iTunesMetadata.plist` and other stuff
    - `Payload/`
        - `[[name].app` ([Bundle]] )
            - Frameworks
            - App's provision profile
            - `Info.plist`
            - `_CodeSignature`
                - `Entitlements` - push notifications, icloud storage and etc. permissions for app
            - App's binary
            
            ![](iOS%20App%20Structure/Untitled%201.png)
            
            ![](iOS%20App%20Structure/Untitled%202.png)
            
            ![](iOS%20App%20Structure/Untitled%203.png)
            
            ![](iOS%20App%20Structure/Untitled%204.png)