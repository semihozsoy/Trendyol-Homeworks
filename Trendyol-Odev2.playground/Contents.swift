import UIKit


/*
 ÖDEVLER
 1-Elimizde sadece harflerden oluşan (noktalama işaret veya sayılar yok) uzun stringler olsun.
 Bu stringlerin içinde bazı harflerin tekrar edeceğini düşünün. Mesela 'a' harfi 20 farklı yerde
 geçiyor. Bir fonksiyon ile verilen parametre değerinden daha fazla bulunan harfler silinecektir.
 Sonra geriye kalan string ekrana yazdırılacaktır.
 
 Örnek string: "aaba kouq bux"
 Tekrar sayısı 2 verildiğinde: a,b,u silinmeli ve ekrana "koq x" yazmalı
 Tekrar sayısı 3 verildiğinde: a silinmeli ve ekrana "b kouq bux
 Tekrar sayısı 4 verildiğinde hiçbir harfi silmemeli
 */

func removeString(text:String, repTime : Int) -> String{
    
 var characterCounts = [Character: Int]()

 for c in text {
    
     if let count = characterCounts[c] {
        characterCounts[c] = count + 1
     } else {
        characterCounts[c] = 1
     }

}
    return text.filter({characterCounts[$0]! != repTime && characterCounts[$0]! <= repTime })
}



 /*
 String ve tekrar sayısını parametre olarak alsın.
 
 2- Elimizde uzun bir cümle olsun, Bazı kelimeler tekrar edecek bir cümle düşünün.
 İstediğimiz ise, hangi kelimeden kaç tane kullanıldığını bulmanız.
 
 string = "merhaba nasılsınız . iyiyim siz nasılsınız . bende iyiyim ."

 */

var cumle = "merhaba nasılsınız . iyiyim siz nasılsınız . bende iyiyim ."
let splited = cumle.split(separator: " ").map({String($0)})
var repTime=[String:Int]()


for c in splited {
   
    if c != "."{
        repTime[c, default: 0] += 1
    }
}

print(repTime)




// Project Euler 4.soru

var sayi : Int
var result : Int = 0


func polindrom (){

for i in 100...999 {
    
    for j in 100...999 {
        
        let number = i * j
        
        let numberStr = String(number)
        let reverseNumberStr = String(numberStr.reversed())
        
        if(numberStr == reverseNumberStr) {
            if(result<number ) {
                result = number
                break
            }
        }
        
    }
}
 
    print("The largest palindrome\(result)")

}

polindrom()





//Project Euler 5.soru



func divideNumber(number:Int)->Bool{
for j in 2...20 {
    
    if number % j != 0 {
        return false
    }
   
}
    return true
}
var currentNumber = 1
while !divideNumber(number:currentNumber){
    currentNumber += 1
}
print("number: ", currentNumber)



//Project Euler 6.soru


func getDifference(n:Double)->Double {
    
    let toplamFormul = ((n) * (n + 1) * (2 * n + 1) ) / 6

    let toplam2Formul = pow(((n * (n + 1) ) / 2 ),2)
    
    var difference :Double

    difference = toplam2Formul - toplamFormul
    return difference
}

getDifference(n: 100)

// Question : How can do this function more effective for complexity phases ?

