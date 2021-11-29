# Design-Patterns-Swift

A software design pattern is a general, reusable solution to a commonly occuring problem within given context in software design. It is not a finished design, it is a description or template for how to solve a problem that can be used in many different situations.

<br>

**Why Design Patterns?**

- Improve maintability
- Decrease dependencies


<br>

## Types of Design Patterns



### 1 - Creational Patterns

Creating objects in a manner suitable for the situation.

- Factory Method
- Abstract Factory
- Singleton



### 2 - Structural Patterns

Ease the design by identifying a simple way to realize relationships between entities.

- Decorator
- Adapter
- Facade



### 3 - Behavioral Patterns

Common communication patterns between objects.

- Strategy
- Observer
- Command

<br>

------------------

I used *Head First Design Patterns by Eric Freeman and Elisabeth Robson in Java* book as reference and implemented them in Swift.

----------------------------


<br>

## Strategy Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/StrategyPattern)

<br>

- Defines a family of algorithms
- Encapsulates each one
- Makes them interchangable objects that can be set or switched at runtime
- Has three parts: an object using a strategy, a strategy protocol, and a family of strategy objects.


<br>

### UML Diagram

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gwwl28swbcj31620u0abp.jpg" alt="converter" width="700" />
