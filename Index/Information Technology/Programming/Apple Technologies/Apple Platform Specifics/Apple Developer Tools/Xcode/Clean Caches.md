## **Clean up CocoaPod caches**

```swift
rm -rf "${HOME}/Library/Caches/CocoaPods"
```

## **Delete old Xcode Simulators**

```swift
xcrun simctl delete unavailable
```

## **Clean up various archives, logs, and derived data folders**

```swift
rm -rf ~/Library/Developer/Xcode/Archives
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~~/Library/Developer/Xcode/iOS Device Logs/
```

**Check out your connected device info in `~/Library/Developer/Xcode/iOS Device Logs/` and delete anything for old iOS devices you’ve connected**