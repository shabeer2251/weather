//
//  MainScreenViewModel.swift
//  weather
//
//  Created by Muhammed Shabeer on 14/10/21.
//

import Foundation


class MainScreenViewModel {
    var locationManager = LocationManager()
    
    func getCurrentLocation() {
        if locationManager.isLocationEnabled() {
            locationManager.getCurrentLocation { location in
                guard let location = location else { return }
                self.getCurrentWeather(location: location)
            }
        } else {
            print("location access denied")
        }
    }
    
    func getCurrentWeather(location: String) {
        NetworkService.sharedInstance().getCurrentWeather(location: location) {[weak self] weather, error in
            guard let self = self else { return }
            if error != nil {
                print(error.debugDescription)
            } else {
                print(weather)
            }
        }
    }
}
