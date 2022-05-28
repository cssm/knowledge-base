- **Links**
	- [Updating Continuous and Transient Haptic Parameters in Real Time | Apple Developer Documentation](https://developer.apple.com/documentation/corehaptics/updating_continuous_and_transient_haptic_parameters_in_real_time)
- **Notes**
	- `iPhone 6s` haptic support
		```swift
		import AudioToolbox

		/// Old haptic styles needed for `iPhone 6s`
		enum OldHapticStyle: UInt32 {
			case weakBoom = 1519
			case strongBoom = 1520
			case threeWeakBooms = 1521
		}
		func triggerOldHaptic(style: OldHapticStyle) {
			AudioServicesPlaySystemSound(style.rawValue)
		}
		```
