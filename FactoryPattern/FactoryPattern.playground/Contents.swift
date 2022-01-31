import UIKit

protocol Pizza { }


class NYStyleCheesePizza: Pizza { }

class NYStyleChickenPizza: Pizza { }

class NYStylePepperoniPizza: Pizza { }

class NYStyleBasicPizza: Pizza { }




protocol PizzaStore {
    func createPizza(item: String) -> Pizza
    func orderPizza(type: String) -> Pizza
}




class NYPizzaStore: PizzaStore {

    func createPizza(item: String) -> Pizza {
        if item == "Cheese" {
            return NYStyleCheesePizza()
        } else if item == "Chicken" {
            return NYStyleChickenPizza()
        } else if item == "Pepperoni" {
            return NYStylePepperoniPizza()
        }

        return NYStyleBasicPizza()
    }

    func orderPizza(type: String) -> Pizza {
        let pizza = createPizza(item: type)
        return pizza;
    }

}




var NYStore = NYPizzaStore()
var order1 = NYStore.orderPizza(type: "Cheese")
print(order1)
