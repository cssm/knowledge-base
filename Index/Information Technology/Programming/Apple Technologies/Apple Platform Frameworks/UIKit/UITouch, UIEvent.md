# `UITouch`, `UIEvent`

- `UIEvent` <- `UITouch`
- `UITouch` encapsulates info about where user pressed, what type of gesture was.
- `UIEvent` holds `UITouch` objects (for example you used two fingers - so two `UITouch` objects created) and through [[Hit Test]] finds out what object (inherited from `UIResponder`) will handle this event. This object becomes a first responded.
- `First responder` - object that can and will handle event
- `UIEvent` - object that holds single user interaction with your application