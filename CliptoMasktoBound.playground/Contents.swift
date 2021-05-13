import UIKit

// ClipsToBounds

//ClipsToBounds aslında bir image ya da view herhangi bir componente cornerRadius vermek istediğimizde
// eğer sadece cornerRadius verirsek istediğimiz gibi köşeleri oval bir görüntüye sahip olamayacaktır bunu sağlamak için
// clipsToBounds = true dememiz gerekiyor.
// clipsToBounds alt görününtünün yalnızca superview 'e uyan kısımlarını göreceğim.

class Sample:UIViewController{
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view1.clipsToBounds = true
        self.view2.clipsToBounds = false
    }
}

//MasktoBounds
// maskToBounds da aslında bir image ya da view herhanbi bir componente cornerRadius verdiğimizde
// sadece cornerRadius verirsek istediğimiz gibi bir oval görüntüye sahip olamıyor fakat bunu sağlamak icin
// maskToBounds = true dersek bunu saglıyor .
// maskToBounds layerın sınırlarının dışına uzanan tüm alt katmanları bu sınırlara kırpılır. Bu durumda katmanı alt katmanlarına açılan bir pencere olarak düşündüğümüzde pencerenin kenarları dışında hiçbir şey gözükmeyecektir.

class Sample2: UIViewController{
    @IBOutlet weak var view3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view3.layer.masksToBounds = true
    }
}


