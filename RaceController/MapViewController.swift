//
//  MapViewController.swift
//  Formula One
//
//  Created by MAC OS  on 22.10.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var segmentedControll: UISegmentedControl!
  
  var race: RaceTrackModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let race = race {
      let location = CLLocationCoordinate2DMake(race.lat, race.long)
      
      let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
      let region = MKCoordinateRegion(center: location, span: span)
      
      mapView.setRegion(region, animated: true)
      
      let annotation = MKPointAnnotation()
      annotation.coordinate = location
      annotation.title = race.raceName
      
      mapView.addAnnotation(annotation)
      mapView.selectAnnotation(annotation, animated: true)
    }
  }
  
  @IBAction func segmentedControlAciton(_ sender: UISegmentedControl) {
    
    let index = sender.selectedSegmentIndex
    
    switch index {
    case 0:
      mapView.mapType = MKMapType.standard
    case 1:
      mapView.mapType = MKMapType.satellite
    case 2:
      mapView.mapType = MKMapType.hybrid
    default:
      break
    }
  }
  
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard !(annotation is MKUserLocation) else { return nil }
    
    let annotationIdentifier = "annotation"
    
    var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
    
    if annotationView == nil {
      annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
      
      annotationView?.canShowCallout = true
    }
    let rightImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    rightImage.image = UIImage(named: "annotation")
    
    annotationView?.rightCalloutAccessoryView = rightImage
    annotationView?.pinTintColor = .red
    return annotationView
  }
}
