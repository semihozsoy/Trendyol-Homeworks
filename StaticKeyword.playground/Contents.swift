import UIKit

//Static Keyword'unu neden kullanırız

struct Car {
    static var favoriteCar = "bmw m3"
    var name: String
    var surname: String
    var age: Int
}

let car = Car(name: "Semih", surname: "Özsoy", age: 23)
print(Car.favoriteCar)

//Static keyword'ünü kullandığımızda struct'taki propertye erişebiliyoruz obje yaratmadan o classdaki property'i
//kullanmamızı sağlıyor.

// What is the difference between static variable and class variable

class Person {
    static var count: Int{
        return 250
    }
    class var averageAge:Double{
        return 30
    }
}

class Student: Person{
    
    override class var averageAge: Double{
        return 19.5
    }
}

print(Student.averageAge)
print(Person.averageAge)
print(Student.count)
//Burda ise Person class'ını inherit ettikten sonra override ederek Student class'ının da içinde kullanmış olduk.
//static variableda ise Person class'ında nasıl tanımlanmış ise o şekilde erişebildik.
