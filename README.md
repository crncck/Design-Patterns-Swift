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
- Template Method

<br>

------------------

I used *Head First Design Patterns by Eric Freeman and Elisabeth Robson in Java* book as reference and implemented them in Swift.

----------------------------


<br>

## 1) Strategy Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/StrategyPattern)

<br>

- Defines a family of algorithms
- Encapsulates each one
- Makes them interchangable objects that can be set or switched at runtime
- Has three parts: an object using a strategy, a strategy protocol, and a family of strategy objects.


<br>

### UML Diagram

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gwwl28swbcj31620u0abp.jpg" alt="converter" width="600" />


<br>

## 2) Observer Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/ObserverPattern)

<br>

- Subject, updates Observers using a common interface
- Defines one-to-many relationship between set of objects
- When the state of one object changes, all of its dependents are notified
- Observers are loosely coupled in that the Subject knows nothing about them


<br>

### UML Diagram

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gyuz5hako1j30xl0u0q5d.jpg" width="450" />

<br>


## 3) Decorator Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/DecoratorPattern)

<br>

- Attaches additional responsibilities to an object dynamically


<br>

### UML Diagram

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gyv0j9lrgxj30yj0u0769.jpg" width="550" />

<br>


## 4) Factory Method Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/FactoryPattern)

<br>

- Defines an interface for creating an object, but lets the subclasses decide
- It should just return a concrete product


<br>

### UML Diagram

<img src="" width="600" />

<br>



## 5) Singleton Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/SingletonPattern)

<br>

- Ensures a class has only one instance and provides a global point of access to it.



<br>

### UML Diagram

<img src="" width="600" />

<br>


## 6) Command Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/CommandPattern)

<br>

- Encapsulates each request as an object
- Removes dependency between receiver and invoker


<br>

### UML Diagram

<img src="" width="600" />

<br>


## 7) Adapter Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/AdapterPattern)

<br>

- Converts the interface of a class into another interface the clients expect.

<br>

### UML Diagram

<img src="" width="600" />

<br>


## 8) Facade Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/FacadePattern)

<br>

- Provides a unified interface to a set of interfaces in a subsystem
- Defines a higher level interface that makes the subsystem easier to use

<br>

### UML Diagram

<img src="" width="600" />

<br>


## 9) Template Method Pattern

-> [Implementation in Swift](https://github.com/crncck/Design-Patterns-Swift/tree/main/TemplateMethodPattern)

<br>

- Defines the skeleton of an algorithm in a method, deferring some steps to subclasses.


<br>

### UML Diagram

<img src="" width="600" />

<br>
