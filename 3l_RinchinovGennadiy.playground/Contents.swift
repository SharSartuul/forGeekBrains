import UIKit

enum engineCondition {
    case start, stop
}

enum windowCondition {
    case open, close
}

enum trunkCondition {
    case full, empty
}

struct someCar {
    let brand: String
    let model: String
    var color: String
    mutating func changeColor(c:String) {
        switch c {
        case "orange":
            self.color = "orange"
        case "silver":
            self.color = "silver"
        case "braun":
            self.color = "braun"
        case "green":
            self.color = "green"
        default:
            print("Этэншн! Ошибка ввода.")
        }
    }
    let release: Int
    var trunkVolume: Double {
        willSet {
            if (trunkCondition == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brand)\(model) свободный объем багажника - \(space) л.")
            } else { print("Этэншн! Ошибка ввода или в багажнике/кузове автомобиля \(brand)\(model) - нет свободного места.")}
        }
    }
    var engineCondition: engineCondition {
        willSet {
            if newValue == .start {
                print ("\(brand)\(model) двигатель запущен.")
            } else {print("\(brand)\(model) двигатель выключен.")}
        }
    }
    var windowCondition: windowCondition {
        willSet {
            if newValue == .open {
                print("\(brand)\(model) окна открыты.")
            } else { print("\(brand)\(model) окна закрыты.") }
        }
    }
    var trunkCondition: trunkCondition
    mutating func emptyTrunck() {
        self.trunkCondition = .empty
        print ("\(brand)\(model) багажник не заполнен.")
    }
}

struct someTruck {
    let brand: String
    let model: String
    var color: String
    mutating func changeColor(c:String) {
        switch c {
        case "orange":
            self.color = "orange"
        case "silver":
            self.color = "silver"
        case "braun":
            self.color = "braun"
        case "green":
            self.color = "green"
        default:
            print("Этэншн! Ошибка ввода.")
        }
    }
    let release: Int
    var bodyVolume: Double {
        willSet {
            if (trunkCondition == .empty) && (bodyVolume > 0) && (bodyVolume != 0) && (newValue < bodyVolume) {
                let space = bodyVolume - newValue
                print ("\(brand)\(model) свободное место в кузове: \(space) л.")
            } else { print("Этэншн! Ошибка ввода или в багажнике/кузове автомобиля \(brand)\(model) - нет свободного места.")}
        }
    }
    var engineCondition: engineCondition {
        willSet {
            if newValue == .start {
                print ("\(brand)\(model) двигатель запущен.")
            } else {print("\(brand)\(model) двигатель выключен.")}
        }
    }
    var windowCondition: windowCondition {
        willSet {
            if newValue == .open {
                print("\(brand)\(model) окна открыты.")
            } else { print("\(brand)\(model) окна закрыты.") }
        }
    }
    var trunkCondition: trunkCondition
    mutating func emptyTrunck() {
        self.trunkCondition = .empty
        print ("\(brand)\(model) багажник пуст.")
    }
}

var car1 = someCar(brand: "Lexus ", model: "LX570:", color: "clear", release: 2018, trunkVolume: 701.0 , engineCondition: .stop, windowCondition: .open, trunkCondition: .empty)
var car2 = someCar(brand: "UAZ", model: " Patriot:", color: "clear", release: 2020, trunkVolume: 650.0, engineCondition: .stop, windowCondition: .close, trunkCondition: .full)

var truck1 = someTruck(brand: "KamAZ", model: " 6522-43:", color: "clear", release: 2016, bodyVolume: 11000.0, engineCondition: .start, windowCondition: .open, trunkCondition: .full)
var truck2 = someTruck(brand: "GAZ", model: " 66 /Shishiga/:", color: "clear", release: 1991, bodyVolume: 4350.0, engineCondition: .start, windowCondition: .close, trunkCondition: .empty)


car1.engineCondition = .start
car1.trunkVolume = 560.0
car1.changeColor(c: "silver")
car2.trunkVolume = 190.0
car2.emptyTrunck()
car2.trunkVolume = 87.4
car2.windowCondition = .open
car2.changeColor(c: "green")

truck1.engineCondition = .stop
truck1.windowCondition = .close
truck2.engineCondition = .stop
truck2.bodyVolume = 3000


print ("Информация о первом автомобиле: \(car1.brand)\(car1.model), год выпуска: \(car1.release), цвет: \(String(describing: car1.color)), свободный объем багажника: \(car1.trunkVolume), состояние двигателя: \(car1.engineCondition)")

