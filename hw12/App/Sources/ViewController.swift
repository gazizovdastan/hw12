//
//  ViewController.swift
//  hw12
//
//  Created by Dastan on 03.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
// MARK: - State
    var isStarted = false
    var isRunning = false
    var isWorkTime = true
    var ccunter = 25
    var remaininTime = 0
    var timer: Timer = Timer()

// MARK: - Lifcycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupViews()

    }
    
// MARK: - UI
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aura")
        return imageView
    }()
    
    private var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private var progressBar: CircularProgressView = {
        let progressView = CircularProgressView(frame: CGRect(x: -90, y: -35, width: 180, height: 180), lineWidth: 5, rounded: false)
        progressView.trackTintColor = .white
        progressView.progressTintColor = .red
        return progressView
    }()
    
    private var playPauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage("", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpOutside)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 50), forImageIn: .normal)
        return button
    }()

// MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(timerLabel)
        view.addSubview(progressBar)
        view.addSubview(playPauseButton)
        
    }
    
    private func setupViews() {
        let heigt = UIScreen.main.bounds.height
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }

// MARK: - Actions

}
