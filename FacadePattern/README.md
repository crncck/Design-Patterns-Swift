# Facade Pattern

- Provides a unified interface to a set of interfaces in a subsystem
- Defines a higher level interface that makes the subsystem easier to use


<br>

### Design Principle:

- **Principle of Least Knowledge**: Talk only to your immediate friends. (less dependencies)

<br>

### Implementation with Swift

First of all, we define classes that will compose a subsystem. The first one is the Amplifier which has 3 methods; on, off, and setVolume.

```swift
class Amplifier {

    var vol: Int = 0

    func on() {
        print("Turning on the amplifier.")
    }

    func off() {
        print("Turning off the amplifier.")
    }

    func setVolume(vol: Int) {

        self.vol = vol
        print("Volume is \(vol)")

    }

}
```

The second one is PopcornPopper which has on and off methods.

```swift

class PopcornPopper {

    func on() {
        print("Turning on the popper.")
    }

    func off() {
        print("Turning of the popper.")
    }

}
```

And the third one is the Screen with up and down methods.

```swift

class Screen {

    func up() {
        print("Moving the screen up.")
    }

    func down() {
        print("Moving the screen down.")
    }

}
```

Now we can start implementing our facade class. We define objects and start with a method called watchMovie. We will call methods of the objects in the order we want.

```swift
class HomeTheaterFacade {

    var amplifier = Amplifier()
    var popcornPopper = PopcornPopper()
    var screen = Screen()

    func watchMovie() {

        popcornPopper.on()
        screen.down()
        amplifier.on()
        amplifier.setVolume(vol: 9)

    }
```

We can create another method to turn off the objects.

```swift
    func endMovie() {

        amplifier.off()
        screen.up()
        popcornPopper.off()

    }
```

Now we will test our code.

```swift
var hmf = HomeTheaterFacade()
hmf.watchMovie()
print("\n")
hmf.endMovie()
```

The output is as follows:

```swift
// Turning on the popper.
// Moving the screen down.
// Turning on the amplifier.
// Volume is 9

// Turning off the amplifier.
// Moving the screen up.
// Turning of the popper.
```

<br>

### UML Diagram

<img src="" width="600" />

