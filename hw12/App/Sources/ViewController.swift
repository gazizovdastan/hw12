//
//  ViewController.swift
//  hw12
//
//  Created by Dastan on 03.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

// MARK: - Lifcycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupViews()

    }
    
// MARK: - Outlets
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aura")
        return imageView
    }()
    
    private var timerLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var playPauseButton: UIButton = {
        let button = UIButton()
        
        return button
    }()

// MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
    }
    
    private func setupViews() {
        let heigt = UIScreen.main.bounds.height
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }

// MARK: - Actions

}
