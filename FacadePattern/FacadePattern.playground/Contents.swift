import UIKit




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



class PopcornPopper {

    func on() {
        print("Turning on the popper.")
    }

    func off() {
        print("Turning of the popper.")
    }

}




class Screen {

    func up() {
        print("Moving the screen up.")
    }

    func down() {
        print("Moving the screen down.")
    }

}



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

    func endMovie() {

        amplifier.off()
        screen.up()
        popcornPopper.off()

    }

}


var hmf = HomeTheaterFacade()
hmf.watchMovie()
print("\n")
hmf.endMovie()
