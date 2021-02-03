import UIKit


//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


enum Actions {
    case openHatch
    case closeHatch
    case enableLed
    case disableLed
    case openTrunk
    case closeTrunk
    case startNitro
    case stopNitro
}

class Car {
    var isHatchOpen: Bool = false
    var isLedEnabled: Bool = false
    
    func performAction (action: Actions) {
        switch action {
        case .openHatch:
            isHatchOpen = true
        case .closeHatch:
            isHatchOpen = false
        case .enableLed:
            isLedEnabled = true
        case .disableLed:
            isLedEnabled = false
        default:
            print("Автомобиль на это не способен")
        }
    }
        func printProperties() {
            print("Люк открыт \(isHatchOpen)")
            print("Дополнительные габаритные огни включены \(isLedEnabled)")
        }
}

class TrunkCar: Car {
    
    var isTrunkOpen: Bool
    
    init(isTrunkOpen: Bool) {
        self.isTrunkOpen = isTrunkOpen
        super.init()
    }
    
    override func performAction( action: Actions) {
        super.performAction(action: .openTrunk)
        
        switch action {
        case .openTrunk:
            isTrunkOpen = true
        case .closeTrunk:
            isTrunkOpen = false
        default:
            print("Автомобиль на это не способен \(action)")
        }
    }
        override func printProperties(){
            super.printProperties()
            print("Багажник открыт \(isTrunkOpen)")
        }
}

class SportCar: Car {
    
    var isNitroStarted: Bool
    
    init(isNitroStarted: Bool) {
        self.isNitroStarted = isNitroStarted
    }
    
    override func performAction(action: Actions) {
        super.performAction(action: .startNitro)
        
        switch action {
        case .startNitro:
            isNitroStarted = true
        case .stopNitro:
            isNitroStarted = false
        default:
            print("Автомобиль на это не способен \(action)")
        }
    }
    override func printProperties(){
        super.printProperties()
        print("Ускоритель активирован \(isNitroStarted)")
    }
}

let baseCar = Car()
let trunkCar = TrunkCar(isTrunkOpen: true)
let sportCar = SportCar(isNitroStarted: false)

baseCar.performAction(action: .closeHatch)
baseCar.performAction(action: .closeTrunk)

trunkCar.performAction(action: .openTrunk)

sportCar.performAction(action: .startNitro)

baseCar.printProperties()
print("______________________")
trunkCar.printProperties()
print("______________________")
sportCar.printProperties()
print("______________________")


