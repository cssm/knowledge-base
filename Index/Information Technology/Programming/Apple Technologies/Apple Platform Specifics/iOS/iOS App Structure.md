# iOS App Structure

![[iOS App Structure/Untitled.png]]

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
            
            ![[iOS App Structure/Untitled 1.png]]
            
            ![[iOS App Structure/Untitled 2.png]]
            
            ![[iOS App Structure/Untitled 3.png]]
            
            ![[iOS App Structure/Untitled 4.png]]