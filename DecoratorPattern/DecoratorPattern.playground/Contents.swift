import UIKit



protocol Beverage {
    var description: String { get set }
    func cost() -> Float
    func getDescription() -> String
}




class HouseBlend: Beverage {

    var description: String

    init() {
        description = "House Blend"
    }

    func cost() -> Float {
        return 5
    }

    func getDescription() -> String {
        return description
    }

}



class Espresso: Beverage {

    var description: String

    init() {
        description = "Espresso"
    }

    func cost() -> Float {
        return 6
    }

    func getDescription() -> String {
        return description
    }

}





protocol CondimentDecorator: Beverage {
    var beverage: Beverage { get set }
    func getDescription() -> String
}



class Milk: CondimentDecorator {

    var beverage: Beverage
    var description = "Milk"

    init(beverage: Beverage) {
        self.beverage = beverage
    }

    func getDescription() -> String {
        return "\(description) + \(beverage.description)"
    }


    func cost() -> Float {
        return 1 + beverage.cost()
    }

}




class Mocha: CondimentDecorator {

    var beverage: Beverage
    var description = "Mocha"

    init(beverage: Beverage) {
        self.beverage = beverage
    }

    func getDescription() -> String {
        return "\(description) + \(beverage.description)"
    }


    func cost() -> Float {
        return 2 + beverage.cost()
    }

}





var order1 = Milk(beverage: HouseBlend())
print("Order 1: \n   \(order1.getDescription()) \n   Total cost: \(order1.cost()) $", terminator: "")
