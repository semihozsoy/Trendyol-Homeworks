import Foundation

//Game Homework

class Game {
    
    
    var nickName: String
    var point: Int
    
    init(nickName:String,point:Int) {
        self.nickName = nickName
        self.point = point
    }
    
    
    func getNickName(nickname:String)->String{
        return nickname
    }
    func bottleLoc(location: Int)->Int {
        return location
    }
    func ballInfo(teta:Int, v:Int){
    
    }
    func launching(){
        if isSteep == false {
            point += 1
        }
    }
    
}

class ballShooter: Game {
    var ballShooter : Int = 0
    public var teta = 0 ..< 90
    public var v = 0 ..< 100
    var g  = 10
    
    init(ballShooter:Int,g:Int) {
        self.ballShooter = ballShooter
        self.g = g
    }
    
    public var tetaRange : Int {
        set {
            if teta ~= newValue {
                 self.tetaRange = newValue
            }
        }
        get {
            return self.tetaRange
        }
        
    }
    
    
    public var vRange : Int {
        set {
            if v ~= newValue {
                self.vRange = newValue
            }
        }
        get {
            return self.vRange
        }
    }
    
    
    func range(r: Int)->Int {
        let r = sin(2 * teta * Double.pi) / 180
        let result = v * v * r / g
       return result
    }
}

class Bottle:ballShooter {
    var d = 0 ..< 1500
    var delta : Int
    var R : Int
    var isSteep = true
    
    init(delta:Int, R: Int) {
        self.delta = delta
        self.R = R
    }
    
    public var dRange : Int {
        set {
            if d ~= newValue {
                self.dRange = newValue
            }
        }
        get {
            return self.dRange
        }
    }
    
    
    func shoot() {
        if  d - delta < R  && R < d + delta{
            isSteep = false
        }else {
            isSteep = true
        }
        
    }
 
    
    
}

