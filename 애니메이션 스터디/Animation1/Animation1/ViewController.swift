import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.makeEnemy()
        self.startTimer()
    }
    
    var timer: Timer? = nil
    var isPause: Bool = true
    
    open func startTimer() {
        guard timer == nil else { return }
        self.timer = Timer.scheduledTimer(timeInterval: 0.5,
                                          target: self,
                                          selector: #selector(self.enemyMove),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    open func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func enemyMove() {
        var topEnemyY = self.topEnemy.frame.origin.y
        topEnemyY += 10
        self.topEnemy.frame = .init(origin: .init(x: self.topEnemy.frame.origin.x,
                                                  y: topEnemyY),
                                    size: self.topEnemy.frame.size)
        
        var bottomEnemyY = self.bottomEnemy.frame.origin.y
        bottomEnemyY -= 10
        self.bottomEnemy.frame = .init(origin: .init(x: self.bottomEnemy.frame.origin.x,
                                                     y: bottomEnemyY),
                                       size: self.bottomEnemy.frame.size)
        
        var leadingEnemyX = self.leadingEnemy.frame.origin.x
        leadingEnemyX += 10
        self.leadingEnemy.frame = .init(origin: .init(x: leadingEnemyX,
                                                      y: self.leadingEnemy.frame.origin.y),
                                        size: self.leadingEnemy.frame.size)
        
        var trailingEnemyX = self.trailingEnemy.frame.origin.x
        trailingEnemyX -= 10
        self.trailingEnemy.frame = .init(origin: .init(x: trailingEnemyX,
                                                       y: self.trailingEnemy.frame.origin.y),
                                         size: self.trailingEnemy.frame.size)
        self.calculatePositionReached()
    }
    
    @objc private func didImageViewMoved(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: soptView)
        let changedX = soptView.center.x + transition.x
        let changedY = soptView.center.y + transition.y
        
        self.soptView.center = .init(x: changedX,
                                     y: changedY)
        sender.setTranslation(.zero, in: self.soptView)
    }
    
    
    private func calculatePositionReached() {
        if self.soptView.frame.minX <= self.topEnemy.frame.minX &&
            self.soptView.frame.maxX >= self.topEnemy.frame.maxX &&
            self.soptView.frame.minY <= self.topEnemy.frame.minY &&
            self.soptView.frame.maxY >= self.topEnemy.frame.maxY
        {
            self.scoreLabel.text = "Game End, Score:\(self.score)"
            self.stopTimer()
        } else {
            self.score += 10
        }
        
        if self.soptView.frame.minX <= self.leadingEnemy.frame.minX &&
            self.soptView.frame.maxX >= self.leadingEnemy.frame.maxX &&
            self.soptView.frame.minY <= self.leadingEnemy.frame.minY &&
            self.soptView.frame.maxY >= self.leadingEnemy.frame.maxY
        {
            self.scoreLabel.text = "Game End, Score:\(self.score)"
            self.stopTimer()
        } else {
            self.score += 10
        }
        
        if self.soptView.frame.minX <= self.trailingEnemy.frame.minX &&
            self.soptView.frame.maxX >= self.trailingEnemy.frame.maxX &&
            self.soptView.frame.minY <= self.trailingEnemy.frame.minY &&
            self.soptView.frame.maxY >= self.trailingEnemy.frame.maxY
        {
            self.scoreLabel.text = "Game End, Score:\(self.score)"
            self.stopTimer()
        } else {
            self.score += 10
        }
        
        if self.soptView.frame.minX <= self.bottomEnemy.frame.minX &&
            self.soptView.frame.maxX >= self.bottomEnemy.frame.maxX &&
            self.soptView.frame.minY <= self.bottomEnemy.frame.minY &&
            self.soptView.frame.maxY >= self.bottomEnemy.frame.maxY
        {
            self.scoreLabel.text = "Game End, Score:\(self.score)"
            self.stopTimer()
        } else {
            self.score += 10
        }
    }
    
    private func setLayout() {
        self.view.addSubview(soptView)
        self.view.addSubview(scoreLabel)
        soptView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        scoreLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    private func makeEnemy() {
        self.view.addSubview(topEnemy)
        self.view.addSubview(bottomEnemy)
        self.view.addSubview(leadingEnemy)
        self.view.addSubview(trailingEnemy)
        
        topEnemy.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        leadingEnemy.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        trailingEnemy.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        bottomEnemy.snp.makeConstraints {
            $0.bottom.centerX.equalToSuperview()
            $0.width.height.equalTo(50)
        }
    }
    
    private lazy var soptView = UIImageView(image: UIImage(named: "image")).then {
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didImageViewMoved(_:)))
        $0.addGestureRecognizer(gesture)
        $0.isUserInteractionEnabled = true
    }
    private let topEnemy = UIImageView(image: UIImage(named: "enemy")).then{ $0.contentMode = .scaleAspectFill }
    private let bottomEnemy = UIImageView(image: UIImage(named: "enemy"))
    private let leadingEnemy = UIImageView(image: UIImage(named: "enemy"))
    private let trailingEnemy = UIImageView(image: UIImage(named: "enemy"))
    private let scoreLabel = UILabel().then {
        $0.textAlignment = .center
    }
}
