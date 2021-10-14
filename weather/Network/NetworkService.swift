//
//  NetworkService.swift
//  weather
//
//  Created by Muhammed Shabeer on 14/10/21.
//

import Foundation
import Alamofire

class NetworkService {
    private static var instance: NetworkService?
    
    class func sharedInstance() -> NetworkService {
        if instance == nil {
            instance = NetworkService()
        }
        return instance ?? NetworkService()
    }
    
    private init() {
        
    }
    
    func getCurrentWeather(location: String, callBack: @escaping (_ weatherInfo: Weather?, _ error: Error?) -> Void) {
        let baseUrl = Constants.getBaseUrl
        let endPoint = "current"
        let apiKey = Constants.getApiAccessKey
        let url = baseUrl + endPoint + "?access_key=" + apiKey + "&query=" + location
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .response{ responseData in
            if responseData.error != nil {
                callBack(nil, responseData.error)
            } else {
                guard let data = responseData.data else {
                    callBack(nil, responseData.error)
                    return }
                do {
                    let weatherInfo = try JSONDecoder().decode(Weather.self, from: data)
                    callBack(weatherInfo, nil)
                } catch {
                    callBack(nil, error)
                }
            }
        }
    }
}
