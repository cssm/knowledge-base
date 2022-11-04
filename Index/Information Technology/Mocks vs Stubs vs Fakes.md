- **Fakes**
	- is the general umbrella term for any kind of mock, fake, stub, double, etc
	- On their own, they typically have no implementation and only fulfil the interface API requirements of the types they are substituting.
- **Stubs** 
	- fakes that do some meaningful work that’s necessary for the objects involved in a test to operate, but not used for anything more than that. They can’t be used in place of real production objects but can return stubbed values. They can’t be asserted on.
- **Mocks** 
	- fakes that can be asserted on
		- Mocks are used in place of other objects just like a fake, but they themselves record some data such as the number of method calls or variables passed for your test to assert on later.