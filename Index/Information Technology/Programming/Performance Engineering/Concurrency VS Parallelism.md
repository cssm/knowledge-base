# Concurrency VS Parallelism

> **Concurrency is about dealing with multiple things at ones.** 

>**Parallelism is about doing multiple things at ones.**

Concurrency is essentially when two tasks are being performed at the same time. This might mean that one is 'paused' for a short duration, while the other is being worked on. Importantly, a different task is begun before an ongoing task is completed. This makes it a multi-programming model.

Parallelism requires that at least two processes/tasks are actively being performed at a particular moment in time.

**Concurrency and Parallelism ->** Way tasks are executed.

**Synchronous and Asynchronous ->** Programming model.

**Single Threaded and Multi-Threaded ->**The environment of task execution.

Here’s a diagram to put it all together. The white terms represent concepts, and the green terms represent ways in which they are implemented or effected:

![](Concurrency%20VS%20Parallelism/Concurrency.png)

![](Concurrency%20VS%20Parallelism/Thread_-1.png)

![](Concurrency%20VS%20Parallelism/Synchronous.png)

![](Concurrency%20VS%20Parallelism/Asynchronous.png)