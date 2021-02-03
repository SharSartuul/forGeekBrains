//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

import UIKit


enum racingCarErros: Error{
    case engineIsKaput
    case nitroIsLeaking
}

class racingCar{
    var engine: Bool
    var nitro: Int
    init(engine: Bool, nitro: Int){
        self.engine = engine
        self.nitro = nitro
    }
   
    func oxygenState() throws{
        if nitro < 10{
            throw racingCarErros.nitroIsLeaking
        }
    }
   
    func engineState() throws{
        if engine == false{
                throw racingCarErros.engineIsKaput
        }
    }
}

var breakthrough = racingCar(engine: false, nitro: 3)

do{
   try breakthrough.oxygenState()
} catch racingCarErros.nitroIsLeaking{
    print("Закись азота на исходе")
}

do{
    try breakthrough.engineState()
} catch racingCarErros.engineIsKaput{
    print("Двигатель переводится в штатный режим")
}

