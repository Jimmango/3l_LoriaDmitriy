import UIKit

enum Engine: String {
    case start = "запещен",
         stop = "заглушен"
}

enum Windows: String {
    case open = "окна открыты",
         close = "окна закрыты"
}

enum CarBody: String {
    case emptyBody = "богажник пустой"
    case fullBody = "богажник заполнен"
    enum Tank: Int {
        case valume = 500
    }
}

struct SportCar {
    var brand: String   // Марка автомобиля
    var year: Int   // Год выпуска
    var trunkVolume: CarBody   // Объем кузова / богажника
    var engineOnOff: Engine // Запущен ли двигатель
    var windowsOpenOnOff: Windows {
        willSet {
            if newValue == .close {
                print("окна закрыты")
            } else {
                print("окна открыты")
            }
        }
    }
    var bank: CarBody.Tank = .valume // Бак
    
    mutating func engineTurn(onOff: Engine) {
        switch onOff {
        case .start:
            self.engineOnOff = .start
            print(onOff.rawValue)
        case .stop:
            self.engineOnOff = .stop
            print(onOff.rawValue)
        }
    }
    
    init () {
        brand = "bmw"
        year = 2020
        trunkVolume = .fullBody
        engineOnOff = .start
        windowsOpenOnOff = .close
        bank = .valume
    }
    
    func description() {
        print("Автомобиль марки \(brand), \(year) года выпуска. Двигатель \(engineOnOff.rawValue), богажник вмещает \(bank.rawValue) литров, \(windowsOpenOnOff.rawValue)")
    }
}

var sportCar: SportCar = SportCar()
sportCar.description()

struct TruckCar {
    var brand: String
    var year: Int
    var truckVolume: CarBody
    var engineOnOff: Engine
    var windowsOpenOnOff: Windows
    var tank: CarBody.Tank
    
    init(brand: String, yearOfRelease: Int, trackVolume: CarBody, engineOnOff: Engine, windowsOpenOnOff: Windows, tank: CarBody.Tank) {
        self.brand = brand
        self.year = yearOfRelease
        self.truckVolume = trackVolume
        self.engineOnOff = engineOnOff
        self.windowsOpenOnOff = windowsOpenOnOff
        self.tank = tank
    }
    
    mutating func carVolume(truck: CarBody) {
        switch truck {
        case .emptyBody:
            "бак пустой"
        case .fullBody:
            "бак заполнен"
        }
    }
    
    func descrition() {
        print("Автомобиль марки \(brand), \(year) года выпуска. Двигатель \(Engine.stop.rawValue), \(Windows.open.rawValue)")
    }
}
var truck: TruckCar = TruckCar(brand: "Ford", yearOfRelease: 2019, trackVolume: .emptyBody, engineOnOff: .start, windowsOpenOnOff: .close, tank: .valume)

truck.descrition()


truck.carVolume(truck: .emptyBody)

truck.engineOnOff

sportCar.trunkVolume.rawValue
