import UIKit



protocol Subject: class {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObservers()
}





protocol Observer: class {
    func update(temperature: Float, humidity: Float, pressure: Float)
}





public class WeatherData: Subject {

    private var temperature: Float = 0.0
    private var humidity: Float = 0.0
    private var pressure: Float = 0.0

    var observers = [Observer]()

    func getTemperature() -> Float {
        return temperature
    }

    func getHumidity() -> Float {
        return humidity
    }

    func getPressure() -> Float {
        return pressure
    }


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

    func setMeasurements(temperature: Float, humidity: Float, pressure: Float) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure

        measurementsChanged()
    }

    func measurementsChanged() {
        notifyObservers()
    }

}







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

    func update(temperature: Float, humidity: Float, pressure: Float) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
    }

    func display() {
        print("CURRENT WEATHER CONDITIONS \n - Temperature: \(temperature) \n - Humidity: \(humidity) \n - Pressure: \(pressure)", terminator: "")
    }
}







var wData: WeatherData = WeatherData()
var cDisplay: CurrentConditionsDisplay = CurrentConditionsDisplay(with: wData)

wData.setMeasurements(temperature: 27, humidity: 45, pressure: 890)
cDisplay.display()                                                                                   // CURRENT WEATHER CONDITIONS
                                                                                                           //  - Temperature: 27.0
                                                                                                           //  - Humidity: 45.0
                                                                                                           //  - Pressure: 890.0

