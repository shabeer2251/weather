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
    @IBOutlet weak var changeLanguageButton: UIButton!
    
    // MARK: initialization
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Viewcontroller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    
    @IBAction func toggleLanguageButtonAction(_ sender: Any) {
        Constants.languageCode.toggle()
        refreshUI()
    }
    
    // MARK: Helper Methods
    func refreshUI() {
        changeLanguageButton.setTitle("Toggle Language".localized, for: .normal)
        let windSpeed = String(self.viewModel.weather?.current?.windSpeed ?? 0)
        let humidity = String(self.viewModel.weather?.current?.humidity ?? 0)
        self.windLabel.text = "Wind: ".localized + windSpeed + " " + "Km/hr".localized
        self.humidityLabel.text = "Humidity: ".localized + humidity + " %"

    }
    func bindViewModel() {
        viewModel.updateCurrentLocationText = {[weak self] text, shouldHideLoading in
            self?.locationLabel.text = text.localized
            if shouldHideLoading {
                DialogUtils.hideLoading()
            }
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
        viewModel.getCurrentLocation()
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
        StyleKit.applyRoundCornerTheme(button: changeLanguageButton, title: "Toggle Language")
        contentView.backgroundColor = UIColor.appContentBox
        self.view.backgroundColor = UIColor.appBackground
    }
}
