# Factory Pattern

- Defines an interface for creating an object, but lets the subclasses decide
- It should just return a concrete product



<br>

### Design Principle:

- **Dependency Inversion Principle**: Depend upon abstractions. Do not depend upon concrete classes.


<br>

### Implementation with Swift

First of all, we will define the protocol of the product which is pizza.

```swift
protocol Pizza { }
```



We have different concrete products which are classes that apply the pizza protocol.

```swift
class NYStyleCheesePizza: Pizza { }

class NYStyleChickenPizza: Pizza { }

class NYStylePepperoniPizza: Pizza { }

class NYStyleBasicPizza: Pizza { }
```


Here the PizzaStore protocol contains the factory method which is createPizza.

```swift
protocol PizzaStore {
    func createPizza(item: String) -> Pizza
    func orderPizza(type: String) -> Pizza
}
```

Now we can create a concrete creator which is NYPizzaStore and we will implement the methods here. Each creator makes their own implementation.

```swift
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
```

To test the pattern, we will create an object from the NYPizzaStore class and call the orderPizza method. This will return us a concrete product.

```swift
var NYStore = NYPizzaStore()
var order1 = NYStore.orderPizza(type: "Cheese")
print(order1)
```


<br>

### UML Diagram

<img src=""  width="500" />

