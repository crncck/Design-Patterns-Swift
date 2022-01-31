import UIKit

protocol Turkey {
    func gobble()
    func fly()
}


protocol Duck {
    func quack()
    func fly()
}


class WildTurkey: Turkey {

    func gobble() {
        print("Gobble gooble")
    }

    func fly() {
        print("I'm flying short distance.")
    }

}



class MallardDuck: Duck {

    func quack() {
        print("Quack.")
    }

    func fly() {
        print("I'm flying.")
    }
}



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


var duckSimulator = DuckSimulator()
duckSimulator.addDuck(duck: MallardDuck())
duckSimulator.addDuck(duck: MallardDuck())
duckSimulator.addDuck(duck: TurkeyAdapter(turkey: WildTurkey()))

duckSimulator.flyAll()
duckSimulator.quackAll()
