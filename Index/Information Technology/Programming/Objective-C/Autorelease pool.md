Autorelease pool means that after leaving the scope of this pool every object that received autorelease messaged will be released (get release message)

*“At the end of the autorelease pool block, objects that received an autorelease message within the block are sent a release message—an object receives a release message for each time it was sent an autorelease message within the block.”*

![](Autorelease%20pool/Autorelease_pool.png)

By calling ***[str autorelease]*** you add*** str*** to autorelease pool

![](Autorelease%20pool/Create_autorelease_pool.png)

To add object into auto release pool call ***autorelease*** ( with ARC you don’t have to do that)

![](Autorelease%20pool/Add_object_to_autorelease_pool.png)

To call ***release*** immediately on all objects added to the pool

![](Autorelease%20pool/Drain_pool.png)

Usually you don’t need to create autorelease pool by yourself

![](Autorelease%20pool/Typically_you_dont_need_to_create_your_own_autorelease_pool_blocks_but_there_are.png)

![](Autorelease%20pool/Main_function_has_autorelease_pool_by_default.png)

Btw there are one use case when you can create a autorelease pool

![](Autorelease%20pool/You_should_create_own_autorelease_pool_you_write_a_loop_that_creates_many.png)