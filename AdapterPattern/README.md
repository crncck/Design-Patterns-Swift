# Adapter Pattern

- Converts the interface of a class into another interface the clients expect.


<br>

### Implementation with Swift

We have two protocols which are Turkey and Duck. Both of them can fly (with different distances) but one gobbles and the other one quacks.


```swift
protocol Turkey {
    func gobble()
    func fly()
}


protocol Duck {
    func quack()
    func fly()
}
```

Now we will create a class WildTurkey.

```swift
class WildTurkey: Turkey {

    func gobble() {
        print("Gobble gooble")
    }

    func fly() {
        print("I'm flying short distance.")
    }

}
```

And a class for MallardDuck.


```swift
class MallardDuck: Duck {

    func quack() {
        print("Quack.")
    }

    func fly() {
        print("I'm flying.")
    }
}
```

The below class makes all the ducks quack and fly. But we should create an adapter to make a turkey gobble and fly with them.

```swift

class DuckSimulator {

    var ducks = [Duck]()

    func addDuck(duck: Duck) {
        ducks.append(duck)
    }

    func flyAll() {
        for duck in ducks {
            duck.fly()
        }
    }

    func quackAll() {
        for duck in ducks {
            duck.quack()
        }
    }
}

```

The TurkeyAdapter class applies Duck protocol and we define an instance of Turkey. The protocol provides a quack method in which we will execute the turkey's gobble method and a fly method to execute the turkey's fly method. So we adapt Turkey to Duck.

```swift
class TurkeyAdapter: Duck {

    var turkey: Turkey

    init(turkey: Turkey) {
        self.turkey = turkey
    }

    func quack() {
        turkey.gobble()
    }

    func fly() {
        turkey.fly()
    }
}
```

Now we can test it.

```swift
var duckSimulator = DuckSimulator()
duckSimulator.addDuck(duck: MallardDuck())
duckSimulator.addDuck(duck: MallardDuck())
duckSimulator.addDuck(duck: TurkeyAdapter(turkey: WildTurkey()))

duckSimulator.flyAll()

// I'm flying.
// I'm flying.
// I'm flying short distance.

duckSimulator.quackAll()

// Quack.
// Quack.
// Gobble gooble
```

<br>

### UML Diagram

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gyzm7prsdwj31j20u0myd.jpg" width="600" />

