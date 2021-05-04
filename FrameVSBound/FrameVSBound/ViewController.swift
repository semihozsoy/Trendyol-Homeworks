//
//  ViewController.swift
//  FrameVSBound
//
//  Created by Semih Özsoy on 4.05.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yellowView.frame = CGRect(x: 0, y: 0, width: 375, height: 270)
        blueView.frame = CGRect(x: 0, y: 0, width: 150, height: 160)
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 160)
        
        yellowView.bounds = CGRect(x: 0, y: 0, width: 375, height: 270)
        blueView.bounds = CGRect(x: 0, y: 100, width: 150, height: 160)
        imageView.bounds = CGRect(x: 0, y: 0, width: 160, height: 160)
        
        
        
        
        
    }
//FRAME: seçilen view'ın superview'inin içerisindeki koordinat sistemine göre lokasyonunu ve boyutlarını belirtir.
    //Framede altındaki elementi de kaydırıyor yani şöyle düşünebiliriz. Sarı ve mavi view olsun mavi view sarının alt elementi olsun image view de mavinin alt elementi olsun ve mavi nin frame X değerini arttırmak aslında sarının koordinat sistemini alıp x ekseninde hareket etmesini sağlıyor. Mavinin frame Y değerini arttırmak aslında sarının koordinat sistemini alıp y ekseninde hareket etmesini sağlıyor. Mavinin Framedeki Y değerinin artırırsam aşağı doğru kaymaya geçiyor, tam tersi azaltırsam yukarı doğru hareket ediyor. Mavinin Framdeki X değerini arttırdığımda sağa, azalttığımda ise sola kayıyor.
    
//Bounds: seçilen view'ın kendi içerisindeki koordinat sistemine göre lokasyonunu ve boyutlarını belirtir.
// Burdaki durumda ise mavi view'ın Bounds X'ini arttırdığımızda biz onun kendi koordinat sistemine göre sağa doğru hareket ettiğini görürüz. Image ise kendi koordinatında kalır. Mavi view'ın eğer Y'sini arttırdığımızda ise kendi koordinatında aşağıya indiğini tam tersi durumda yukarı çıktığını görmüş oluruz.
  
    
    
}

