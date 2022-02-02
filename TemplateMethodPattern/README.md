# Template Method Pattern

- Defines the skeleton of an algorithm in a method, deferring some steps to subclasses.

<br>

### Design Principle:

- **Hollywood Principle**: Don't call us, we'll call you. Low-level components don't call high-level components. High-level components decide when and how to call.

<br>

### Implementation with Swift

The CaffeineBeverage protocol provides the template method which holds the steps of an algorithm.

```swift
protocol CaffeineBeverage {

    func prepareRecipe()                    // template method

    func boilWater()                        // base operation 1
    func pourInCup()                        // base operation 2

    func brew()                             // required operation 1
    func addCondiments()                    // required operation 2

}
```

We provide the steps and the implementation of base operations using an extension. The brew and addCondiments are the methods that will differ from class to class.

```swift
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
```

The Coffee class adapts the CaffeineBeverage protocol and implements brew and addCondiments methods in it.

```swift
class Coffee: CaffeineBeverage {

    func brew() {
        print("Brewing coffee grinds")
    }

    func addCondiments() {
        print("Adding sugar and milk")
    }

}
```

Tea class is very similar to Coffee class. The implementations of methods differ.

```swift
class Tea: CaffeineBeverage {

    func brew() {
        print("Steeping tea bag")
    }

    func addCondiments() {
        print("Adding lemon")
    }
}
```
We can create objects from the tea and coffee class and call their template method which is prepareRecipe.

```swift
print("--- Preparing the coffee ---")
var coffee = Coffee()
coffee.prepareRecipe()
print("\n")

print("--- Preparing the tea ---")
var tea = Tea()
tea.prepareRecipe()
```

The output is as follows:

```swift
// --- Preparing the coffee ---
// Boiling the water
// Brewing coffee grinds
// Pouring in a cup
// Adding sugar and milk


// --- Preparing the tea ---
// Boiling the water
// Steeping tea bag
// Pouring in a cup
// Adding lemon
```

<br>

### UML Diagram

<img src="" width="600" />

