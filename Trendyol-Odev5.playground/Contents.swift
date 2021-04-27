import Foundation


//Problem 7
// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//What is the 10 001st prime number?


    
func listPrimeNumbers(){
        
        var isPrime = false
        var counter = 0
        var number = UInt8.max
    
    for i in 2...number{
        
        for j in counter ..< 10001 {
            
        }
            if number % i == 0 {
                isPrime = true
                break
            }
        
            if isPrime == true {
                number
            }
        
        }
    }

//Problem 8
//The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

//Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
    



