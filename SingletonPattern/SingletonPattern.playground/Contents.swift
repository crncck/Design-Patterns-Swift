import UIKit

class Singleton {

    static var shared: Singleton = {

        let instance = Singleton()

        return instance

    }()

    private init() {}

}


class Test {

    static func testSingleton() {

        let instance1 = Singleton.shared
        let instance2 = Singleton.shared

        if (instance1 === instance2) {
            print("Singleton works, variables equal.")
        } else {
            print("Singleton failed, variables contain different instances.")
        }
    }
}


Test.testSingleton()
