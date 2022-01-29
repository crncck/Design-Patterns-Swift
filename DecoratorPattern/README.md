# Decorator Pattern

- Attaches additional responsibilities to an object dynamically


<br>

### Design Principle:

- **Open-Closed Principle**: Classes should be open for extension, but closed for modification.


<br>

### Implementation with Swift

First of all, we will define a Beverage protocol. It has 1 variable called description and 2 methods.

```swift
protocol Beverage {
    var description: String { get set }
    func cost() -> Float
    func getDescription() -> String
}
```

We can create a class called HouseBlend which is a beverage. It has an unique cost and description.

```swift
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
```

We have a protocol called CondimentDecorator which is also a beverage. It has a beverage to be added as a decorator.

```swift
protocol CondimentDecorator: Beverage {
    var beverage: Beverage { get set }
    func getDescription() -> String
}
```


The implementation below shows the Milk class which is a CondimentDecorator. It returns additions of its cost and its beverage's cost.

```swift
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
```

We can create an order an test our pattern.

```swift
var order1 = Milk(beverage: HouseBlend())
print("Order 1: \n   \(order1.getDescription()) \n   Total cost: \(order1.cost()) $", terminator: "")
```

The output is:


```swift
// Order 1: 
   // Milk + House Blend 
   // Total cost: 6.0 $
```

<br>

### UML Diagram

<img src="" alt="converter"  width="500" />

