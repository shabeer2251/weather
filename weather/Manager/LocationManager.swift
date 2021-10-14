//
//  LocationManager.swift
//  weather
//
//  Created by Muhammed Shabeer on 14/10/21.
//

import Foundation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager?
    var location: CLLocation?
    
    typealias LastLocationClosure = ((_ location: CLLocation) -> Void)
    var lastLocationCompletionHandler: LastLocationClosure?
    
    override init() {
        super.init()
        setupLocationManager()
    }
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        DispatchQueue.main.async {
            self.locationManager?.startUpdatingLocation()
        }
    }
    
    func stopUpdatingLocation() {
        DispatchQueue.main.async {
            self.locationManager?.stopUpdatingLocation()
        }
    }
    
    func isLocationEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    func checkAuthrization() -> Bool {
        var isEnabled = false
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined, .restricted, .denied:
            isEnabled = false

        case .authorizedAlways, .authorizedWhenInUse:
            isEnabled = true
        }
        return isEnabled
    }
    
    func getCurrentLocation() -> CLLocation? {
        return locationManager?.location
    }
    
    // MARK: - CLLocationManager Delegates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            DispatchQueue.main.async {
                self.lastLocationCompletionHandler?(lastLocation)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            startUpdatingLocation()
        }
    }
    
    func getPlaceMark(for location: CLLocation, with completion: @escaping(_ placeMark: CLPlacemark?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(location) { (placeMarks, error) in
            if placeMarks?.count ?? 0 > 0 {
                completion(placeMarks?[0], nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    func getCurrentLocation(completion: @escaping (String?) -> Void) {
        lastLocationCompletionHandler = { [weak self] location in
            guard let this = self else { return }
            this.stopUpdatingLocation()
            this.getPlaceMark(for: location, with: { (placemark, _) in
                completion(placemark?.locality?.withoutSpaces)
            })
        }
        stopUpdatingLocation()
        startUpdatingLocation()
    }
}
