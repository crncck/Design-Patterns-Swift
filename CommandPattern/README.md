# Command Pattern

- Encapsulates each request as an object
- Removes dependency between receiver and invoker


<br>

### Implementation with Swift

We have a command protocol that has a method called execute. We will put the actions that we want to take, inside this method.

```swift
protocol Command {
    func execute()
}
```
We create a light class which has on and off methods.

```swift
class Light {

    func on() {
        print("Turning on the light.")
    }

    func off() {
        print("Turning off the light.")
    }

}
```

Now we define a class called LightOnCommand that applies Command protocol. It has a light instance and executes the light's on method. We also have LightOffCommand which is very similar but executes the light's off method.

```swift

class LightOnCommand: Command {

    var light = Light()

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.on()
    }

}
```

We also define a stereo class.


```swift
class Stereo {

    var volume: Int = 0

    func on() {
        print("Turning on the stereo.")
    }

    func off() {
        print("Turning off the stereo.")
    }

    func setCD() {
        print("CD is set.")
    }

    func setDVD() {
        print("DVD is set.")
    }

    func setVolume(volume: Int) {
        print("Setting the volume to \(volume).")
        self.volume = volume
    }

}
```

The stereo has a similar OnCommand to the previous one. But this time we execute several methods to make the stereo ready.

```swift
class StereoOnWithCdCommand: Command {

    var stereo: Stereo

    init(stereo: Stereo) {
        self.stereo = stereo
    }

    func execute() {
        stereo.on()
        stereo.setCD()
        stereo.setVolume(volume: 11)
    }

}
```

We define a class called MacroCommand that stores several commands in an array and helps us to execute them all at once.

```swift
class MacroCommand: Command {

    var commands: [Command?]

    init(commands: [Command?]) {
        self.commands = commands
    }

    func execute() {
        for command in commands {
            command?.execute()
        }
    }
}
```

The RemoteControl class has 7 slots and each slot has 2 buttons to store on and off commands. When the button on a certain slot is pressed the defined command executes.

```swift
class RemoteControl {

    var onCommands: [Command?]
    var offCommands: [Command?]

    init() {
        onCommands = [Command?](repeating: nil, count: 7)
        offCommands = [Command?](repeating: nil, count: 7)
    }

    func setCommand(slot: Int, onCommand: Command?, offCommand: Command?) {

        onCommands[slot] = onCommand
        offCommands[slot] = offCommand

    }

    func buttonClicked(slot: Int, on: Bool) {

        if on {
            if (onCommands[slot] != nil) {
                onCommands[slot]?.execute()
            }
        } else {
            if (offCommands[slot] != nil) {
                offCommands[slot]?.execute()
            }
        }
    }
}

```

We define two commands which are for light and stereo objects. Then we store them as macro command and define them on the second slot of the remote control.

```swift
var onCommand = LightOnCommand(light: light)
var onCommand1 = StereoOnWithCdCommand(stereo: stereo)

var partyOn = [Command?](repeating: nil, count: 2)
partyOn[0] = onCommand
partyOn[1] = onCommand1

var macroCommand = MacroCommand(commands: partyOn)
remoteControl.setCommand(slot: 2, onCommand: macroCommand, offCommand: nil)

remoteControl.buttonClicked(slot: 2, on: true)
```

When we clicked the button of the second slot we get the following output.

```swift
// Turning on the light.
// Turning on the stereo.
// CD is set.
// Setting the volume to 11.
```


<br>

### UML Diagram

<img src="" width="600" />

