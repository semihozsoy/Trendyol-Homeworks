import UIKit

//ODEV: If let - guard let kullanım tercihlerini neye göre belirlersiniz
/*
The "else" case of guard must exit the current scope. Generally that means it must call return or abort the program. guard is used to provide early return without requiring nesting of the rest of the function.

if let nests its scope, and does not require anything special of it. It can return or not.
*/




//ODEV2:Bir Oyun senaryosu  için dönme açıları ile ilgili bir switch case yapısı deneyiniz
// Bu soru için sadece enum kullanımı

        enum rotateAngles: Int {
            case ninetyDegree = 90
            case fourtyFiveDegree = 45
            case twoSeventyDegree = 270
            case oneEightyDegree = 180
            case threeSixtyDegree = 360
        }
        let angles : rotateAngles = .fourtyFiveDegree

        switch angles {
            case .fourtyFiveDegree :
                let degree = rotateAngles.fourtyFiveDegree
                print("\(degree.rawValue) for moving to north-east side")
                break
            case .ninetyDegree:
                let degree = rotateAngles.ninetyDegree
                print("\(degree.rawValue) for moving to east side")
                break
            case .oneEightyDegree:
                let degree = rotateAngles.oneEightyDegree
                print("\(degree.rawValue) for moving to south side")
                break
            case .threeSixtyDegree:
                let degree = rotateAngles.threeSixtyDegree
                print("\(degree.rawValue) for moving to north side")
                break
            default:
                print("This is a different angle, change your angle for move")
                break
                
            }

    






