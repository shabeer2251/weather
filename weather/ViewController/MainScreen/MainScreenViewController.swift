//
//  MainScreenViewController.swift
//  weather
//
//  Created by Muhammed Shabeer on 14/10/21.
//

import UIKit

class MainScreenViewController: UIViewController {
    private let viewModel: MainScreenViewModel
  
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupUI()
    }
    
    func bindViewModel() {
        viewModel.getCurrentLocation()
        
        viewModel.updateCurrentLocationText = {[weak self] text in
            self?.locationLabel.text = text
        }
        
        viewModel.updateCurrentWeather = { [weak self] weather in
            let temp = String(weather.current?.temperature ?? 0)
            let desc = weather.current?.weatherDescriptions?.first ?? ""
            let humidity = String(weather.current?.humidity ?? 0)
            let windSpeed = String(weather.current?.windSpeed ?? 0)
            self?.temperatureLabel.text = temp + " °"
            self?.weatherDescriptionLabel.text = desc
            self?.windLabel.text = "Wind: " + windSpeed + " Km/hr"
            self?.humidityLabel.text = "Humidity: " + humidity + " %"
        }
        
        viewModel.updateImage = { [weak self] image in
            self?.weatherImageView.image = image
            DialogUtils.hideLoading()
        }
    }

    func setupUI() {
        DialogUtils.showLoading()
        StyleKit.applyBoldLabelStyle(label: locationLabel, fontSize: 24, color: UIColor.label)
        StyleKit.applyBoldLabelStyle(label: temperatureLabel, fontSize: 30, color: UIColor.appLabel)
        StyleKit.applyMediumLabelStyle(label: weatherDescriptionLabel  , fontSize: 20, color: UIColor.appLabel)
        StyleKit.applyMediumLabelStyle(label: windLabel  , fontSize: 16, color: UIColor.appLabel)
        StyleKit.applyMediumLabelStyle(label: humidityLabel  , fontSize: 16, color: UIColor.appLabel)
        StyleKit.applyRoundCornersAndShadowAroundView(view: contentView)
        StyleKit.applyRoundCornersAndShadowAroundView(view: weatherImageView)
        contentView.backgroundColor = UIColor.appContentBox
        self.view.backgroundColor = UIColor.appBackground
    }
}
