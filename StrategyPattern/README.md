# Strategy Pattern

- Defines a family of algorithms
- Encapsulates each one
- Makes them interchangable objects that can be set or switched at runtime
- Has three parts: an object using a strategy, a strategy protocol, and a family of strategy objects.



### Design Principles:

- Identify the aspects of the application that vary and seperate them from what stays the same.

- Program to an interface, not an implementation.

- Favor composition over inheritance. (more flexibility, encapsulate a family of algorithms into their own set of classes, able to change behavior at runtime)



### Implementation with Swift

We will use a protocol to represent each behavior. For duck class, we have two behaviors, fly and quack. Each implementation of behavior will implement one of these protocols. In the code below, fly behavior is implemented as a protocol and two classes NoFly and FlyWithWings implemented this protocol.

```swift
protocol FlyBehavior {
    func fly()
}

class NoFly: FlyBehavior {
    func fly() {
        print("I can't fly.")
    }
}

class FlyWithWings: FlyBehavior {
    func fly() {
        print("I can fly.")
    }
}
```



Ducks also have quack behavior, we will implement that too.

```swift
protocol QuackBehavior {
    func quack()
}

class Quack: QuackBehavior {
    func quack() {
        print("Quack")
    }
}

class Squeak: QuackBehavior {
    func quack() {
        print("Squeak")
    }
}

class MuteQuack: QuackBehavior {
    func quack() {
        print("Silence")
    }
}
```



Now we can start to implementation of our Duck class. Duck class has two optional variables, `flyBehavior` and `quackBehavior`, which are declared as the behavior supertype. We will override the display method in subclasses and print the type of duck. `performFly()` and `performQuack()` methods call the protocols fly and quack method.

```swift
class Duck {
    var flyBehavior: FlyBehavior?
    var quackBehavior: QuackBehavior?

    func swim() {
        print("I am swimming.")
    }

    func display() {}

    func performFly() {
        flyBehavior?.fly()
    }

    func performQuack() {
        quackBehavior?.quack()
    }
}
```



Here is the implementation of mallard duck which is a subclass of the duck.

```swift
class MallardDuck: Duck {
    override init() {
        super.init()
        flyBehavior = FlyWithWings()
        quackBehavior = Quack()
    }

    override func display() {
        print("I'm a Mallard duck.")
    }
}
```



Now we can create an object from the `mallardDuck` class and get its behavior.

```swift
var mallardDuck: Duck = MallardDuck()
mallardDuck.display()                           // I'm a Mallard duck.
mallardDuck.performFly()                        // I can fly.
mallardDuck.performQuack()                      // Quack
```



### UML Diagram of Protocol

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gwwl2aonywj311d0mk751.jpg" alt="converter"  width="500" />

