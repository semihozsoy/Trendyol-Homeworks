import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Bu fonksiyon UIViewController'ın hayat döngüsünde yalnızca 1 defa çalışır.Çağrıldığı zaman, ViewController'ın oluşturulduğunu ve kendisine bağlı IBOutlet'lerin hazır hale geldiğini biliriz.
    }

    override func viewWillAppear(_ animated: Bool) {
        //Bu fonksiyon UIViewController görünmeden hemen önce çağırılır. Alanları gizlemek, göstermek veya ekranın görünmesinden önce her defasında olmasını istediğimiz işlemler için kullanılır.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //UIViewController görüntülendikten hemen sonra çağırılır. Bir animasyonu başlatmak veya bir API'dan verilerin yüklenmeye başlaması için uygun bir noktadır.
    }

    override func viewWillDisappear(_ animated: Bool) {
        //ViewWillAppear'a benzer olarak bu fonksiyon da bir UIViewController objesi ekrandan kaybolmadan hemen önce çalışır. viewWillAppear gibi bu fonksiyon da UIViewController objesinin hayat döngüsü boyunca birden fazla kez çalışabilir. Kullanıcı farklı bir sayafaya geçmeye başladığında çalışır.
    }
    override func viewDidDisappear(_ animated: Bool) {
        //Bir UIViewController objesi ekrandan kaybolduktan sonra bu fonksiyon çalışır.Kaybolduktan sonra arkada çalışmaya devam etmesini istemediğiniz işlemler için genellikle bu fonksiyonu override edersiniz.
    }
}


