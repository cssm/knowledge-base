- **Notes**
	- Making a serial queue that’s less aggressive about creating threads (“non-overcommit”):
    ```swift
    let q = DispatchQueue(…, target: DispatchQueue.global())
    ```
	- Multiplexing work onto a single serial queue efficiently:
    ```swift
    theQueueWeAreAlreadyOn.async { … }
    ```
	- Don't do this 👎🏻
		- Global queues as anything but targets
		- Almost any use of concurrent queues
		- Queues as locks (`os_unfair_lock` is more efficient)
		- Turning async into sync with semaphores
		- manually specifying QoS (Most of the time you can/should rely on automatic propagation, you only need to do it manually if you want to override that for some reason
- **Links**
	- [Making efficient use of the libdispatch (GCD)](https://gist.github.com/tclementdev/6af616354912b0347cdf6db159c37057)