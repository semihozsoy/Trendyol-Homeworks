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
        bottle.distance = d
    }
    func ballInfo(teta:Int,v:Int){
        ballShooter.shootAngle = teta
        ballShooter.speed = v
        
    }
    func launching(){
        let range = ballShooter.range()
        bottle.shoot(flight: range)
        
        if bottle.isSteep == false {
            gamer.point += 1
            print("şişeyi vurdun!")
        }
        print("\(gamer.point) kullanıcının puanı")
        print("Oyun sonlandı.")
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
    private let locationX: Int = 0 //şimdilik kullanılmamış
    private let shootAngleRange = 0...90
    private var availableShootAngle = 0
    private var availableSpeed = 0
    private let speedRange = 0...100
    private let gravityOfEarth  = 10
    public var shootAngle: Int {
        set {
            if shootAngleRange ~= newValue {
                availableShootAngle = newValue
            }else{
                print("teta must be in 0 and 90")
            }
        }
        get {
            return availableShootAngle
        }
    }
    
    public var speed: Int {
        set {
            if speedRange ~= newValue {
                availableSpeed = newValue
            } else {
                availableSpeed = 0
                print("Speed must be in 0 and 100")
            }
        }
        get {
            return availableSpeed
        }
    }
    
    init() { }
    
    func range() -> Double {
        let angleValue = sin(Double(2 * availableShootAngle))
        let result = Double(availableSpeed) * Double(availableSpeed) * Double(angleValue) / Double(gravityOfEarth)
        return result
    }
}

class Bottle {
    var d = 0...1500
    var delta = 0.1 ... 1
    var isSteep = true
    private var availableDistance = 0
    private var availableBottleWeight = 0.0
    public var distance: Int {
        set {
            if d ~= newValue {
                availableDistance = newValue
            } else {
                availableDistance = 0
                print("D must be 0 and 1500")
            }
        }
        get {
            return availableDistance
        }
    }
    
    public var bottleWeight : Double {
        set {
            if delta ~= newValue {
                availableBottleWeight = newValue
            }else{
                availableBottleWeight = 0
                print("Delta must be 0.1 and 1")
            }
        }
        get {
            return availableBottleWeight
        }
    }
    
    init() {
        
    }
    
    func shoot(flight:Double) {
        let range = Double(availableDistance) - Double(availableBottleWeight) ... Double(availableDistance) + Double(availableBottleWeight)
        if  range.contains(flight)   {
            isSteep = false
        }else {
            isSteep = true
        }
    }
}


let game = Game(gamer: Gamer(nickName: "semo", point: 0), ballShooter: BallShooter(), bottle: Bottle())

game.ballInfo(teta: 10, v: 50)
game.bottleLoc(d:228)
game.bottle.bottleWeight = 0.5
game.launching()


game.ballInfo(teta: 10, v: 50)
game.bottleLoc(d:1600)
game.bottle.bottleWeight = 0.5
game.launching()


// Eğer ki classın sadece içinde kullanıyorsan private yapmaya özen gösterebilirsin,
// StyleGuide'daki gibi boşluklara vs dikkat edilebilir,
// İsimlendirmeler anlamlı olmalı
// Eğer değeri değişmeyecek bir değer ise var yerine let tanımlanabilir
// variable let vs değerler classın üstünde, sonra init metodu, sonra kendi metodları şeklinde sıralanabilir
// playgroundda yeniden adlandırma yaparken, birini değiştirtek sonra beklersen, uyarı vereek oraları değiştrip sonra diğer isme geçebilirsin. Diğer türlü karışabilir.
// cmd + A = hepsini seç, ardından ctrl + I ile indentationları commitlemeden önce düzeltebilirsin
// bir kelimenin başına gelip option shift ok(sağ veya sol) basarak kelimeyi seçip, comd c , cmd f, cmd v ile arama ekranına yapıştırmış oluyoruz
// cmd yön oklarıyla hareket edebilirsin, direkt yön okuna basarsan sonuna kadar gidiyor, sadece o yöndeki her şeyi seçmek istersen cmd shift ok'a basabilirsin

// cmd shift 7 -> seçili alanları yorum satırı
// cmd shift yan ok satırı seçiyorum sonra cmdyi bırakıp shift ve yukarı ok ile satırları seçiyorum
