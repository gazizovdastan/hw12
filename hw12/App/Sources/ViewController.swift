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
    var counter = 15
    var remainingTime = 0
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
        imageView.image = UIImage(named: "day")
        return imageView
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 80)
        return label
    }()
    
    private lazy var progressBar: CircularProgressView = {
        let progressView = CircularProgressView(frame: CGRect(x: -150, y: -35, width: 300, height: 180), lineWidth: 5, rounded: false)
        progressView.trackColor = .black
        progressView.progressColor = UIColor(red: 0.98, green: 0.48, blue: 0.13, alpha: 1.00)
        return progressView
    }()
    
    private lazy var playPauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 70), forImageIn: .normal)
        return button
    }()
    
    // MARK: - Setup
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(timerLabel)
        view.addSubview(progressBar)
        view.addSubview(playPauseButton)
    }
    
    private func setupViews() {
        _ = UIScreen.main.bounds.height
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        timerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(250)
        }
        progressBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(250)
        }
        playPauseButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80)
        }
    }

// MARK: - Actions

    @objc func buttonPressed() {
        if !isStarted {
            timer = createTimer()
            isStarted = true
            isRunning = true
            self.playPauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
        } else {
            if isRunning {
                self.playPauseButton.setImage(UIImage(systemName: "play"), for: .normal)
                pauseTimer()
                isRunning = false
            } else {
                self.playPauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
                resumeTimer()
                isRunning = true
            }
        }
    }
    
    func createStartTime() {
        timerLabel.text = "15:00"
    }

    func pauseTimer() {
        remainingTime = counter
        timer.invalidate()
    }

    func resumeTimer() {
        counter = remainingTime
        timer = createTimer()
    }

    func setWorkTimeColors() {
        progressBar.progressColor = UIColor(red: 0.98, green: 0.48, blue: 0.13, alpha: 1.00)
        backgroundImageView.image = UIImage(named: "day")
    }

    func setRelaxTimeColors() {
        progressBar.progressColor = UIColor(red: 0.43, green: 0.66, blue: 0.89, alpha: 1.00)
        backgroundImageView.image = UIImage(named: "night")
        playPauseButton.tintColor = .white
        progressBar.trackColor = .white
        timerLabel.textColor = .white
    }

    func createTimer() -> Timer {
        var progressPercent: Float = isWorkTime ? 0.06667 : 0.2
        self.createStartTime()
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.counter -= 1
            if self.counter < 0 {
                self.progressBar.progress = 0
                if self.isWorkTime {
                    self.isWorkTime = false
                    self.setRelaxTimeColors()
                    self.counter = 4
                    progressPercent = 0.2
                } else {
                    self.isWorkTime = true
                    self.setWorkTimeColors()
                    self.counter = 14
                    progressPercent = 0.06667
                }
            }
            self.progressBar.progress += progressPercent
            self.timerLabel.text = "\(self.counter):00"
        }
        return timer
    }

}
