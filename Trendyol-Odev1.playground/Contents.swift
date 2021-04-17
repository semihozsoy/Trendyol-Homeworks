import UIKit

//1.soru

var result = 0

for i in 0..<100 {
    if i % 3 == 0 || i % 3 == 5 {
        result += i
    }
}
print(result)

//2.soru

var a = 1
var b = 1
var sonuc = 1
var even = 0

for j in 1..<10 {
    
    a = b
    b = sonuc
    sonuc = a + b
    
    
    if sonuc % 2 == 0 {
        var temp = 0
        sonuc += temp + even
            
    }
 
 
}
print(sonuc)


//3. soru

var sayi = 600851475143
var isPrim : Bool = true

for i in 2...sayi  {
    
    if sayi % i == 0 {
        print("prime number")
        isPrim = false
       break
    }
}







