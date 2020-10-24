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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
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
        let myPin = MKPointAnnotation()
        myPin.coordinate = location
        myPin.title = "テスト"
        myPin.subtitle = "さぶテスト"
        mapView.addAnnotation(myPin)
        mapView.setRegion(region,animated:true)
        mapView.delegate = self
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
        print(view.annotation?.title)
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
        //ここがpushとは違う
        self.present(nextView, animated: true, completion: nil)


        
    }
    //中心に戻るメゾット
    private func goBackCenter() {
           self.mapView.setCenter(self.mapView.userLocation.coordinate, animated: false)
           self.mapView.setUserTrackingMode(MKUserTrackingMode.followWithHeading, animated: false)
       }
    
}



