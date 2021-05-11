//
//  ViewController.swift
//  MapApp
//
//  Created by Semih Özsoy on 10.05.2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var lastLocation : CLLocation?
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checklocationServices()
    
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func showUserLocationCenterMap(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checklocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuth()
        } else {
            //kullanıcıya bir uyarı gösterip ayarlardan açmaya yönlendirebiliriz
          showAccessAlert()
        }
      
    }
    
    func showAccessAlert(){
        let alertController = UIAlertController(title: "Error", message: "Location services is not enabled", preferredStyle: UIAlertController.Style.alert)
        
        //MARK: Ayarlardan konum açılacak
        /*
        let settingsAlert = UIAlertAction(title: "Settings", style: .default) { (_) in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return}
            if UIApplication.shared.canOpenURL(settingsUrl){
                UIApplication.shared.open(settingsUrl) { success in
                    print("ayarlar açıldı: \(success)")
                }
            }
        }*/
        
        let settingsButton = UIAlertAction(title: "Go to Settings", style: .default) { (_) in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else{return}
            if UIApplication.shared.canOpenURL(settingsUrl){
                UIApplication.shared.open(settingsUrl) { success in
                    print("Go to settings: \(success)")
                }
            }
        }
        
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
       // alerController.addAction(okButton)
        alertController.addAction(settingsButton)
        present(alertController, animated: true, completion: nil)
    }
    
    func checkLocationAuth(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
           listenLocation()
            
        case .authorizedAlways:
            break
        case .denied:
            showAccessAlert()
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        default:
            break
        }
    }


}

extension ViewController: CLLocationManagerDelegate{
    //location update durumu
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    // TODO:
        guard let location = locations.last  else { return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
    //verilen izin kontrolu
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        checkLocationAuth()
    }
    
    // kullanıcının konumunu izleme
    
    func listenLocation(){
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
        locationManager.startUpdatingLocation()
        lastLocation = getCenterLocation(mapView: mapView)
    }
    
    //Haritanın merkezini hesaplama
    
    func getCenterLocation(mapView:MKMapView)-> CLLocation{
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
        
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(mapView: mapView)
        let geoCoder = CLGeocoder()
        
        guard let lastLocation = lastLocation else { return }
        guard center.distance(from: lastLocation) > 30 else { return }
        
        self.lastLocation = center
        geoCoder.reverseGeocodeLocation(center) { (placemarks,error) in
            if let error = error {
                print(error)
            }
            guard let placemark = placemarks?.first else {return}
            
            let city = placemark.locality ?? "City"
            let street = placemark.thoroughfare ?? "Street"
            
            DispatchQueue.main.async {
                self.locationLabel.text = "\(city) - \(street)"
            }
         
            
        }
    }
}
