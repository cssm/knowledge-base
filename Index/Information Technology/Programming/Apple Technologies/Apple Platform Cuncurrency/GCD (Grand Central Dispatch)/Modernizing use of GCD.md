# Modernizing use of GCD

Main idea is too if we have different queues make a new target queue for them. with this simple trick we can reduce amount of context switches.

For `DispatchSource` is good rule to not mutate object after activation, because it is affects performance.

## Fair Lock vs Unfair lock

Unfair lock is reduce number of contex switching between threads