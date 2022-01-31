import UIKit


protocol CaffeineBeverage {

    func prepareRecipe()                    // template method

    func boilWater()                        // base operation 1
    func pourInCup()                        // base operation 2

    func brew()                             // required operation 1
    func addCondiments()                    // required operation 2

}



extension CaffeineBeverage {

    func prepareRecipe() {
        boilWater()
        brew()
        pourInCup()
        addCondiments()
    }

    func boilWater() {
        print("Boiling the water")
    }

    func pourInCup() {
        print("Pouring in a cup")
    }

}



class Coffee: CaffeineBeverage {

    func brew() {
        print("Brewing coffee grinds")
    }

    func addCondiments() {
        print("Adding sugar and milk")
    }

}



class Tea: CaffeineBeverage {

    func brew() {
        print("Steeping tea bag")
    }

    func addCondiments() {
        print("Adding lemon")
    }
}

print("--- Preparing the coffee ---")
var coffee = Coffee()
coffee.prepareRecipe()
print("\n")

print("--- Preparing the tea ---")
var tea = Tea()
tea.prepareRecipe()

