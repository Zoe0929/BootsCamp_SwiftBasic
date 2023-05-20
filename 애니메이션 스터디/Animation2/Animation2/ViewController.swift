//
//  ViewController.swift
//  Animation2
//
//  Created by 지희의 MAC on 2023/05/17.
//
import UIKit
import SnapKit

class ViewController: UIViewController {
    let testView = TestView()
    
    // 프레임을 미리 지정해주는 것이 좋음. snapkit과 충돌 방지.
    let progressView = ProgressView(frame: .init(origin: .zero, size: .init(width: 100,height: 100)))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(progressView)
        progressView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        progressView.progressAnimation(duration: 5, value: 1)
        
    }
    //draw함수이용하기
    //그리는 과정이 필요하기 때문에 draw 함수를 호출해서 사용해야함.
}

class TestView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setAnimateBackGround() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.duration = 2
        animation.fromValue = UIColor.red.cgColor
        animation.toValue = UIColor.blue.cgColor
        animation.isRemovedOnCompletion = false
        self.layer.add(animation, forKey: "backgroundAni")
    }
    
}

class ProgressView: UIView {
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(3 * Double.pi / 4)
    private var endPoint = CGFloat(Double.pi / 4)
    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    func createCircularPath() {
        self.backgroundColor = .white
        let circularPath = UIBezierPath(arcCenter: .init(x: self.frame.width / 2.0,
                                                         y: self.frame.height / 2.0),
                                        radius: (frame.size.height - 10) / 2.0 ,
                                        startAngle: startPoint,
                                        endAngle: endPoint,
                                        clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 3
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.black.withAlphaComponent(0.4).cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 3
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(progressLayer)
    }
    func progressAnimation(duration: TimeInterval, value: Double) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
