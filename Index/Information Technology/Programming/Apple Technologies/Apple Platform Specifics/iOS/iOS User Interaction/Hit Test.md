- **Links**
	- [Hit-Testing in iOS](http://smnh.me/hit-testing-in-ios/)
- **Notes**
	- `gesture recognizer` -> `hit-test` -> [Responder Chain](Responder%20Chain.md)
	- Hit test is using DFS with bypass starting from root node to find out view. Every view also stores an array of subviews where last element represents last added view, so that allows to determinate which view should be tapped when they are overlaid. 
	- ![[Hit Test/Untitled.png]]
	- ![[Hit Test/Used_to_determine_which_view_becomes_first_responder_for_a_touch_event._Returns_the_farthest.png]]


