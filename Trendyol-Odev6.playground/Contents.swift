import Foundation

//Game Homework

class Game {

    var gamer : Gamer
    var ballShooter : BallShooter
    var bottle : Bottle
    
    init(gamer:Gamer,ballShooter: BallShooter, bottle: Bottle ) {
        self.gamer = gamer
        self.ballShooter = ballShooter
        self.bottle = bottle
    }
 
    func getNickName()->String{
        return gamer.nickName
    }
    func bottleLoc(d:Int) {
       bottle.dRange = d
    }
    func ballInfo(teta:Int,v:Int){
        ballShooter.tetaRange = teta
        ballShooter.vRange = v
        
    }
    func launching(){
       let range = ballShooter.range()
       bottle.shoot(R: range)
        
        if bottle.isSteep == false {
            gamer.point += 1
        }
        print(gamer.point)
    }
}

class Gamer {
    var nickName: String
    var point: Int
    init(nickName:String,point:Int) {
        self.nickName = nickName
        self.point = point
    }
    
}

class BallShooter {
    var ballShooter : Int = 0
    public var teta = 0...90

    public var v = 0...100
    var g  = 10
    
    init() {
     
    }
    
    public var tetaRange : Int {
        set {
            if teta ~= newValue {
                 _tetaRange = newValue
            }else{
                print("teta must be in 0 and 90")
            }
        }
        get {
            return _tetaRange
        }
    }
    private var _tetaRange = 0

    public var vRange : Int {
        set {
            if v ~= newValue {
                _vRange = newValue
            }else{
                print("V must be in 0 and 100")
            }
        }
        get {
            return _vRange
        }
    }
    private var _vRange = 0
 
    
    func range()->Double {
        let r = sin(Double(2 * _tetaRange))
        let result = Double(_vRange) * Double(_vRange) * Double(r) / Double(g)
       return result
    }
}

class Bottle {
    var d = 0...1500
    var delta = 0.1 ... 1
    var isSteep = true
    
    init() {
        
    }
    
    public var dRange : Int {
        set {
            if d ~= newValue {
                _dRange = newValue
            }else{
                print("D must be 0 and 1500")
            }
        }
        get {
            return _dRange
        }
    }
    private var _dRange = 0
    
    public var deltaRange : Double {
        set {
            if delta ~= newValue {
                _deltaRange = newValue
            }else{
                print("Delta must be 0.1 and 1")
            }
        }
        get {
            return _deltaRange
        }
    }
    private var _deltaRange : Double = 0
    
    func shoot(R:Double) {
        let range = Double(_dRange) - Double(_deltaRange) ... Double(_dRange) + Double(_deltaRange)
        if  range.contains(R)   {
            isSteep = false
        }else {
            isSteep = true
        }
    }
}


let game = Game(gamer: Gamer(nickName: "semo", point: 0), ballShooter: BallShooter(), bottle: Bottle())
game.ballInfo(teta: 10, v: 50)
game.bottleLoc(d:229)
game.bottle.deltaRange = 0.5
game.launching()




