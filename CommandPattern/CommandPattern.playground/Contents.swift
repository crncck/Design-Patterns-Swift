import UIKit



protocol Command {
    func execute()
}




class Light {

    func on() {
        print("Turning on the light.")
    }

    func off() {
        print("Turning off the light.")
    }

}





class LightOnCommand: Command {

    var light = Light()

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.on()
    }

}





class LightOffCommand: Command {

    var light = Light()

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.off()
    }

}






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




class StereoOffCommand: Command {

    var stereo: Stereo

    init(stereo: Stereo) {
        self.stereo = stereo
    }

    func execute() {
        stereo.off()
    }

}



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



var light = Light()
var stereo = Stereo()

var remoteControl = RemoteControl()

var onCommand = LightOnCommand(light: light)
var offCommand = LightOffCommand(light: light)
remoteControl.setCommand(slot: 0, onCommand: onCommand, offCommand: offCommand)

var onCommand1 = StereoOnWithCdCommand(stereo: stereo)
var offCommand1 = StereoOffCommand(stereo: stereo)
remoteControl.setCommand(slot: 1, onCommand: onCommand1, offCommand: offCommand1)

var partyOn = [Command?](repeating: nil, count: 2)
partyOn[0] = onCommand
partyOn[1] = onCommand1

var macroCommand = MacroCommand(commands: partyOn)
remoteControl.setCommand(slot: 2, onCommand: macroCommand, offCommand: nil)

remoteControl.buttonClicked(slot: 2, on: true)

