//
//  MainScreenViewModel.swift
//  weather
//
//  Created by Muhammed Shabeer on 14/10/21.
//

import UIKit


class MainScreenViewModel {
    var locationManager = LocationManager()
    var updateCurrentLocationText: ((_ text: String,_ shouldHideLoading: Bool) -> Void)?
    var updateCurrentWeather: ((Weather) -> Void)?
    var updateImage: ((UIImage?) -> Void)?
    var weather: Weather?
    
    func getCurrentLocation() {
        if locationManager.isLocationEnabled(), locationManager.checkAuthrization() {
            locationManager.getCurrentLocation { [weak self] location in
                guard let location = location else { return }
                self?.updateCurrentLocationText?(location, false)
                self?.getCurrentWeather(location: location.withoutSpaces)
            }
        } else {
            self.updateCurrentLocationText?("location access denied", true)
            print("location access denied")
        }
    }
    
    func getCurrentWeather(location: String) {
        NetworkService.sharedInstance().getCurrentWeather(location: location) {[weak self] weather, error in
            guard let self = self else { return }
            if error != nil {
                self.updateCurrentLocationText?("Failed to fetch weather Info", true)
                print(error.debugDescription)
            } else {
                guard let weather = weather else { return }
                self.weather = weather
                self.updateCurrentWeather?(weather)
                self.getImage(urlString: weather.current?.weatherIcons?.first ?? "")
            }
        }
    }
    
    func getImage(urlString: String) {
        NetworkService.sharedInstance().getImage(urlString: urlString) { image, error in
            if error != nil {
                self.updateImage?(nil)
                print(error.debugDescription)
            } else {
                self.updateImage?(image)
            }
        }
    }
}
