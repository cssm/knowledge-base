# Finding Cycle

![[Finding Cycle/Untitled.png]]

Just add to pointers: one that visit every node, and second that visit every second node. If cycle exists this two pointers mets, if not - second pointer will reach end of list first. 

This works because we can think of this like that: second pointer is reduces distance with every iteration by one, so if cycle exists (infinite loop), then at some point of time they'll met. So we can move pointers by any value (for example first by two and second by three) but distance between them should reduces by one on every iteration.