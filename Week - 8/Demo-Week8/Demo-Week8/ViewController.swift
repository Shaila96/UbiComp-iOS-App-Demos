//
//  ViewController.swift
//  Demo-Week8
//
//  Created by Shaila Zaman on 10/15/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit
import UserNotifications
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var latitude = 29.7199
    var longitude = -95.3422
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // showLocalNotification()
        
        // showUHLocation()
        
        // setupLongPressGestureRecognizer()
        
        showMyLocation()
    }
    
    func showMyLocation() {
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // print(locations)
        
        let location = locations[0]
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: myLocation, span: span)
        
        self.mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation=true
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = myLocation
        annotation.title = "My Location"
        annotation.subtitle = "Hi"

        self.mapView.addAnnotation(annotation)
    }
    
    func setupLongPressGestureRecognizer() {
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(press:)))
        longPressGestureRecognizer.minimumPressDuration=2.0
        mapView.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc func addAnnotation(press: UILongPressGestureRecognizer) {
        if press.state == .began {
            
            let location = press.location(in: mapView)
            let coordinates = mapView.convert(location, toCoordinateFrom: mapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = "Long Pressed Location"
            
            DispatchQueue.main.async {
               self.mapView.addAnnotation(annotation)
           }
        }
    }
    
    
    func showUHLocation() {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation=true
        
        
        
        let loc = CLLocation(latitude: latitude, longitude: longitude)
        
        CLGeocoder().reverseGeocodeLocation(loc) { (placemark, error) in
            if error != nil {
                print("Error in Reverse Geocoding")
                return
            }
            
            if let place = placemark?[0] {
                print(placemark!)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = location
                annotation.title = "University of Houston"
                
                if place.locality != "" {
                    annotation.subtitle = "\(place.locality!), \(place.country!)"
                }
                
                DispatchQueue.main.async {
                    self.mapView.addAnnotation(annotation)
                }
                
            }
        }
    }
    
    
    
    func showLocalNotification() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { didAllow, error in
            
            if error != nil {
                print("There is error in notifications")
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Simple Local Notification!"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
            let request = UNNotificationRequest(identifier: "finished", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        })
        
    }


}

