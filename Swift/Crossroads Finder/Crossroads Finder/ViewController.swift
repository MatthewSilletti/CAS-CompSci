//
//  ViewController.swift
//  Crossroads Finder
//
//  Created by Matthew Silletti on 3/23/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var chicfilaLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var xrdsLabel: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    let CROSSROADS_LAT = 34.0240892
    let CROSSROADS_LONG = -118.4747321
    
    let CHICFILA_LAT = 34.010270
    let CHICFILA_LONG = -118.480068
        
    let HOUSE_LAT = 34.051504
    let HOUSE_LONG = -118.518217
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // CheckForLocation()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
    }
    @IBAction func zoomOut(_ sender: Any) {
        let factor = 2.0
        zoom(factor)
    }
    
    
    @IBAction func zoomIn(_ sender: Any) {
        let factor = 0.5
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
        let crossroadsLocation = CLLocationCoordinate2DMake(CROSSROADS_LAT, CROSSROADS_LONG)
        let crossroadsPoint = MKMapPoint(crossroadsLocation)

        let chicfilaLocation = CLLocationCoordinate2DMake(CHICFILA_LAT, CHICFILA_LONG)
        let chicfilaPoint = MKMapPoint(chicfilaLocation)

        let houseLocation = CLLocationCoordinate2DMake(HOUSE_LAT, HOUSE_LONG)
        let housePoint = MKMapPoint(houseLocation)
        
        
//        let compassButton = MKCompassButton(mapView: mapView)
//        compassButton.compassVisibility = .adaptive
//        compassButton.translatesAutoresizingMaskIntoConstraints = true
//        //compassButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -12).isActive = true
//        //compassButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 12).isActive = true
//        mapView.addSubview(compassButton)

        
        let scaleview = MKScaleView(mapView: mapView)
        scaleview.scaleVisibility = .visible
        scaleview.translatesAutoresizingMaskIntoConstraints = true
        //scaleview.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -12).isActive = true
        //scaleview.topAnchor.constraint(equalTo: compassButton.topAnchor, constant: 12).isActive = true
        mapView.addSubview(scaleview)
        
        
        if rect.contains(crossroadsPoint) {
            label.text = "CROSSROADS!"
            xrdsLabel.backgroundColor = UIColor(displayP3Red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
            chicfilaLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
            homeLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        } else if rect.contains(chicfilaPoint){
            label.text = "GODS FOOD OF CHOICE"
            xrdsLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
            chicfilaLabel.backgroundColor = UIColor(displayP3Red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
            homeLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        } else if rect.contains(housePoint) {
            label.text = "NEW LOCATION DISCOVERED: PRISON"
            xrdsLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
            chicfilaLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
            homeLabel.backgroundColor = UIColor(displayP3Red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
        } else {
            label.text = "Bruh"
            xrdsLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
            chicfilaLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
            homeLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }

    }
    
    @IBAction func gotoXrds(_ sender: Any) {
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2DMake(CROSSROADS_LAT, CROSSROADS_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        
//        label.text = "CROSSROADS!"
//        xrdsLabel.backgroundColor = UIColor(displayP3Red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
    }
    
    @IBAction func gotoChicFilA(_ sender: Any) {
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2DMake(CHICFILA_LAT, CHICFILA_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
//        label.text = "GODS FOOD OF CHOICE"
//        chicfilaLabel.backgroundColor = UIColor(displayP3Red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
    }
    @IBAction func gotoHome(_ sender: Any) {
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2DMake(HOUSE_LAT, HOUSE_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
//        label.text = "NEW LOCATION DISCOVERED: PRISON"
//        homeLabel.backgroundColor = UIColor(displayP3Red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
    }
    
    @IBAction func findMe(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = mapView.region.span
        print(span)
        let coords = locations.suffix(1)[0].coordinate
        let newRegion = MKCoordinateRegion(center: coords, span: span)
        mapView.setRegion(newRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    //func CheckForLocation() {
        //         let rect = mapView.visibleMapRect
        //        let crossroadsLocation = CLLocationCoordinate2DMake(CROSSROADS_LAT, CROSSROADS_LONG)
        //        let crossroadsPoint = MKMapPoint(crossroadsLocation)
        ////
        //        let chicfilaLocation = CLLocationCoordinate2DMake(CHICFILA_LAT, CHICFILA_LONG)
        //        let chicfilaPoint = MKMapPoint(chicfilaLocation)
        //
        //        let houseLocation = CLLocationCoordinate2DMake(HOUSE_LAT, HOUSE_LONG)
        //        let housePoint = MKMapPoint(houseLocation)
        //
        //        if rect.contains(crossroadsPoint) {
        //            label.text = "CROSSROADS!"
        //            xrdsLabel.backgroundColor = UIColor(displayP3Red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
        //            chicfilaLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        //            homeLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        //        } else if rect.contains(chicfilaPoint){
        //            label.text = "GODS FOOD OF CHOICE"
        //            xrdsLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        //            chicfilaLabel.backgroundColor = UIColor(displayP3Red: 72.0, green: 245.0, blue: 66.0, alpha: 1.0)
        //            homeLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        //        } else if rect.contains(housePoint) {
        //            label.text = "NEW LOCATION DISCOVERED: PRISON"
        //            xrdsLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        //            chicfilaLabel.backgroundColor = UIColor(displayP3Red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        //            homeLabel.backgroundColor = UIColor(displayP3Red: 72.0, green: 245.0, blue: 66.0, alpha: 1.0)
        //        }
//    }
}

