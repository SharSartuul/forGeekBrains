
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.



import UIKit

enum Actions {
    case openWindow
    case closeWindow
    case openDoor
    case closeDoor
    case fillTrunk
    case emptyTrunk
    case turnEngineOn
    case turnEngineOff
}


struct DefaultProperties {
    var areWindowsOpen: Bool = false
    var areDoorsOpen: Bool = false
}

protocol Car {
    var defaultPriperties: DefaultProperties { get set }
    var areWindowsOpen: Bool { get set }
    var areDoorsOpen: Bool { get set }
    
    mutating func performAction(action: Actions)
}

extension Car {
    
    var areWindowsOpen: Bool {
        get {
            return defaultPriperties.areWindowsOpen
        }
        
        set {
            defaultPriperties.areWindowsOpen = newValue
        }
    }
    
    var areDoorsOpen: Bool {
        get {
            return defaultPriperties.areDoorsOpen
        }
        
        set {
            defaultPriperties.areDoorsOpen = newValue
        }
    }
    
    mutating func openWindows () {
        self.areWindowsOpen = true
    }
    
    mutating func closeWindows () {
        self .areWindowsOpen = false
    }
    
    mutating func openDoors () {
        self.areDoorsOpen = true
    }
    
    mutating func closeDoors () {
        self.areDoorsOpen = false
    }
    
    mutating func performAction(action: Actions) {
        switch action {
        case .openWindow:
            self.areWindowsOpen = true
        case .closeWindow:
            self.areWindowsOpen = false
        case .openDoor:
            self.areDoorsOpen = true
        case .closeDoor:
            self.areDoorsOpen = false
        default:
            break
        }
    }
}

class TrunkCar: Car {
    var defaultPriperties: DefaultProperties = DefaultProperties()
    
    var isTrunkEmpty: Bool = true
    
    func performAction(action: Actions) {
        switch action {
        case .fillTrunk:
            isTrunkEmpty = false
            print("Багажник полный")
        case .emptyTrunk:
            isTrunkEmpty = true
            print("Багажник пустой")
        default:
           
        break
        
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "isTrunkEmpty \(self.isTrunkEmpty)"
    }
}


class SportCar: Car {
    var defaultPriperties: DefaultProperties = DefaultProperties()
    
    var isEngineTurnedOn: Bool = false
    
    func performAction(action: Actions) {
        switch action {
        case .turnEngineOn:
            isEngineTurnedOn = true
            print("turn engine on")
        case .turnEngineOff:
            isEngineTurnedOn = false
            print("turn engine off")
        default:
            // Do nothing
        break
        
        }
    }
}

extension SportCar: CustomStringConvertible {

    var description: String {
        return "isEngineTurnedOn \(self.isEngineTurnedOn)"
    }
}

var trunkCar = TrunkCar()
trunkCar.performAction(action: .openDoor)
trunkCar.areDoorsOpen
trunkCar.performAction(action: .fillTrunk)
trunkCar.openWindows()
trunkCar.description

var sportCar = SportCar()
sportCar.performAction(action: .turnEngineOn)
sportCar.openWindows()

sportCar.description



