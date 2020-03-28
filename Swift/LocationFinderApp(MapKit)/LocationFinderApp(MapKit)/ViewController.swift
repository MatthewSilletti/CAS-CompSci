//
//  ViewController.swift
//  LocationFinderApp(MapKit)
//
//  Created by Matthew Silletti on 3/27/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let MHouse_LAT = 34.051504
    let MHouse_LONG = -118.518217
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distanceLabel.text = "How Far Are You From Home?"
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        let homeCoord = CLLocationCoordinate2D(latitude: MHouse_LAT, longitude: MHouse_LONG)
        let point = MKMapPoint(homeCoord)
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        // Do any additional setup after loading the view.
    }
    @IBAction func ZoomIn(_ sender: Any) {
        let factor = 0.5
        zoom(factor)
    }
    
    @IBAction func ZoomOut(_ sender: Any) {
        let factor = 2.0
        zoom(factor)
    }
    
    func zoom(_ zoomFactor: Double) {
        let region = mapView.region
        let span = region.span
        let newLat = span.latitudeDelta * zoomFactor
        let newLong = span.longitudeDelta * zoomFactor
        let newSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let homeLocaction = CLLocationCoordinate2D(latitude: MHouse_LAT, longitude: MHouse_LONG)
        let homePoint = MKMapPoint(homeLocaction)
        if rect.contains(homePoint){
            currentLocationLabel.text = "You Are At Matthew's House"
        } else {
            currentLocationLabel.text = "You Are Not At Matthew's House"
            }

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = mapView.region.span
            print(span)
        let coords = locations.suffix(1)[0].coordinate
        let newRegion = MKCoordinateRegion(center: coords, span: span)
            mapView.setRegion(newRegion, animated: true)
    
        let personalLat = coords.latitude
        let personalLong = coords.longitude
            
        let a = personalLat - MHouse_LAT
        let b = personalLong - MHouse_LONG
        
//        let (a, b) = personalLat - MHouse_LAT, personalLong - MHouse_LONG)
        let distance = hypotenuse(a, b)
        let realDist = distance * 364280
        
        distanceLabel.text = "You Are \(realDist) Feet Away From Matthew's House"
            
    }
    @IBAction func findMe(_ sender: Any) {
        locationManager.requestLocation()
        //locationManager()
        // cant figure out how to call this function!
    }
    
    func hypotenuse(_ a: Double, _ b: Double) -> Double {
        return (a * a + b * b).squareRoot()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

}

