//
//  MainScreenViewController.swift
//  weather
//
//  Created by Muhammed Shabeer on 14/10/21.
//

import UIKit

class MainScreenViewController: UIViewController {
    private let viewModel: MainScreenViewModel
    
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
