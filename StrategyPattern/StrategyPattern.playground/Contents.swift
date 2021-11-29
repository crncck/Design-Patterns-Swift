import UIKit




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



class ModelDuck: Duck {

    override init() {
        super.init()
        flyBehavior = NoFly()
        quackBehavior = MuteQuack()
    }

    override func display() {
        print("I'm a Model duck.")
    }

}




var mallardDuck: Duck = MallardDuck()
mallardDuck.display()                           // I'm a Mallard duck.
mallardDuck.performFly()                        // I can fly.
mallardDuck.performQuack()                      // Quack



var modelDuck: Duck = ModelDuck()
modelDuck.display()                             // I'm a Model duck.
modelDuck.performFly()                          // I can't fly.
modelDuck.performQuack()                        // Silence
