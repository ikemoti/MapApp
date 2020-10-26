//
//  ViewController.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/24.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    let mapView: MKMapView = .init()
    var locationManager: CLLocationManager?
    var pins: [MKPointAnnotation] = []
    let testData: [Sauna] = [
        .init(name: "フォーシーズンズホテル丸の内 東京", address:"    東京都 千代田区 丸の内１丁目１１−１ " , openTime: "13:20:00", closeTime: "13:20:00", timeException: nil, url: "https://sauna-ikitai.com/saunas/7385"),
        .init(name: "ティップネス丸の内スタイル", address:" 東京都 千代田区 丸の内１丁目１−１ " , openTime: "07:00:00", closeTime: "23:00:00", timeException: nil, url: "https://sauna-ikitai.com/saunas/5559"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setMapAttributes()
        makePin(sauna: testData){ pin in
            self.mapView.addAnnotations(self.pins)
        }
    }
    
    func setLayout(){
        self.view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    func setMapAttributes(){
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        let location:CLLocationCoordinate2D
                   = CLLocationCoordinate2DMake(35.68154,139.752498)
        mapView.setCenter(location,animated:true)
        var region:MKCoordinateRegion = mapView.region
        region.center = location
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        mapView.setRegion(region,animated:true)
        mapView.delegate = self
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            // 許可されてない場合
            case .notDetermined:
                // 許可を求める
                manager.requestWhenInUseAuthorization()
            // 拒否されてる場合
            case .restricted, .denied:
                // 何もしない
                break
            // 許可されている場合
            case .authorizedAlways, .authorizedWhenInUse:
                // 現在地の取得を開始
                manager.startUpdatingLocation()
                break
            default:
                break
        }
    }
    //破棄されたタイミングでピンの選択解除
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
        self.present(nextView, animated: true, completion: nil)


        
    }
    //中心に戻るメゾット
//    private func goBackCenter() {
//           self.mapView.setCenter(self.mapView.userLocation.coordinate, animated: false)
//           self.mapView.setUserTrackingMode(MKUserTrackingMode.followWithHeading, animated: false)
//    }
    func makePin(sauna:[Sauna], comletion: @escaping (MKPointAnnotation)->()){
        sauna.forEach {
            let pin: MKPointAnnotation = .init()
            var saunaAdress: String = .init()
            var saunaLocation:CLLocationCoordinate2D = .init()
            saunaAdress = $0.address
            pin.title = $0.name
            CLGeocoder().geocodeAddressString(saunaAdress) { placemarks, error in
                if let lat = placemarks?.first?.location?.coordinate.latitude {
                    saunaLocation.latitude = lat
                }
                if let lng = placemarks?.first?.location?.coordinate.longitude {
                    saunaLocation.longitude = lng
                }
                pin.coordinate = saunaLocation
                self.pins.append(pin)

                comletion(pin)
            }
        }
    }
    
}
