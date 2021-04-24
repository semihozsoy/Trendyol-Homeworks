import UIKit


// MARK: ODEV: Girilen sayının asal solup olmadığını bulan bir extension yazınız.

// 2 verilince prime number olma olayını düzeltmen lazım !!!!!

extension Int {
    
    func primeNumber() {
        var isPrime = false
        
        for i in 2...self-1{
            if self % i == 0 {
                isPrime = true
                break
            }
        }
         if isPrime == true {
             print("This is not prime number")
         }else {
            print("This is prime number")
         }
 
    }
}
 
var number = 32
number.primeNumber()


//MARK: ODEV: İki Parametreli ve Farklı Tipli bir generic örneği yapınız ????

func diffParGeneric<T:Comparable,M:Comparable>(array:[T], secondItem:M)-> T? {
    
    for item in array {
        
    }

   
    return nil

}
