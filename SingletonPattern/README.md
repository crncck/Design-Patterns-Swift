# Singleton Pattern

- Ensures a class has only one instance and provides a global point of access to it.


<br>

### Implementation with Swift

We create a single static type object of the class and return it. A private initializer allows us to instantiate an object of a class. Making it private restricts the object creation of the class from the outside of the class. 

```swift
class Singleton {

    static var shared: Singleton {

        let instance = Singleton()

        return instance

    }

    private init() {}

}
```

Now we can test if two instances are same.


```swift
class Test {

    static func testSingleton() {

        let instance1 = Singleton.shared
        let instance2 = Singleton.shared

        if (instance1 === instance2) {
            print("Singleton works, variables equal.")
        } else {
            print("Singleton failed, variables contain different instances.")
        }
    }
}
```

As seen below there is only one object created from the class, our singleton pattern works.


```swift
Test.testSingleton()

// Singleton works, variables equal.
```
