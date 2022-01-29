# Observer Pattern

- Subject, updates Observers using a common interface
- Keeping the objects in the know
- Defines one-to-many relationship between set of objects
- When the state of one object changes, all of its dependents are notified
- Observers are loosely coupled in that the Subject knows nothing about them


<br>

### Design Principle:

- **Loose Coupling**: Objects interact but they have very little knowledge about each other.


<br>

### Implementation with Swift

First of all, we will define the Subject protocol. It has 3 main methods which are for registering, removing, and notifying observers.

```swift
protocol Subject: class {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObservers()
}
```



The observer protocol contains an update method.

```swift
protocol Observer: class {
    func update(temperature: Float, humidity: Float, pressure: Float)
}
```



Now we can create our Subject which is WeatherData class.
```swift
public class WeatherData: Subject {

    private var temperature: Float = 0.0
    private var humidity: Float = 0.0
    private var pressure: Float = 0.0

    var observers = [Observer]()

```



Those are the three methods that the Subject protocol provides. We add a new observer to our observers array with registerObserver function. We can also remove an observer with removeObserver method. The notifyObserver method notifies each observer of the Subject when a change occurs.

```swift
func registerObserver(observer: Observer) {
        observers.append(observer)
    }

func removeObserver(observer: Observer) {
        observers.removeAll(where: { $0 === observer })
}

func notifyObservers() {
  for observer in self.observers {
      observer.update(temperature: temperature, humidity: humidity, pressure: pressure)
  }
}
```


We will implement an observer which is called CurrentConditionsDisplay. It has an Subject which is an instance of WeatherData class.

```swift
class CurrentConditionsDisplay: Observer {

    private weak var weatherData: Subject?

    init(with subject: Subject) {
        self.weatherData = subject
        self.weatherData?.registerObserver(observer: self)
    }

    deinit {
        self.weatherData?.removeObserver(observer: self)
    }

    private var temperature: Float = 0.0
    private var humidity: Float = 0.0
    private var pressure: Float = 0.0
```

CurrentConditionsDisplay class also has update and display method. 

```swift
    func update(temperature: Float, humidity: Float, pressure: Float) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
    }

    func display() {
        print("CURRENT WEATHER CONDITIONS \n - Temperature: \(temperature) \n - Humidity: \(humidity) \n - Pressure: \(pressure)", terminator: "")
    }
```


Now we can create an observer and register it to a subject. Then the subject class will notify its observers when a measure changes.

```swift
var wData: WeatherData = WeatherData()
var cDisplay: CurrentConditionsDisplay = CurrentConditionsDisplay(with: wData)

wData.setMeasurements(temperature: 27, humidity: 45, pressure: 890)
cDisplay.display()   
```

And the output is:

```swift
 // CURRENT WEATHER CONDITIONS
     //  - Temperature: 27.0
     //  - Humidity: 45.0
     //  - Pressure: 890.0
```


<br>

### UML Diagram

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gyuzfgmjylj31090u0dii.jpg" alt="converter"  width="500" />

