//
//  ViewController.swift
//  Tutorial
//
//  Created by jackercleaning on 2018/12/12.
//  Copyright © 2018 Charles Chien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var idFBtn: UIButton!
    @IBOutlet weak var idBBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let frame = UIScreen.main.bounds
        let path = UIBezierPath(rect: frame)
        let rect = CGRect(x: 140, y: 57, width: idFBtn.frame.width, height: idFBtn.frame.height)
        let subPath = UIBezierPath(roundedRect: rect, cornerRadius: 2)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClick))
        tapGesture.cancelsTouchesInView = true
        bgView.addGestureRecognizer(tapGesture)
        path.append(subPath)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd

        bgView.layer.mask = shapeLayer
        
    }
    @IBAction func idFBtnClick(_ sender: Any) {
        let frame = UIScreen.main.bounds
        let path = UIBezierPath(rect: frame)
        let rect = CGRect(x: 226, y: 57, width: idFBtn.frame.width, height: idFBtn.frame.height)
        let subPath = UIBezierPath(roundedRect: rect, cornerRadius: 2)
        
        path.append(subPath)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        
        bgView.layer.mask = shapeLayer
    }
    
    @objc func viewClick(tap: UITapGestureRecognizer) {
//        tap.view?.removeFromSuperview()
        let frame = UIScreen.main.bounds
        let path = UIBezierPath(rect: frame)
        let rect = CGRect(x: 226, y: 57, width: idFBtn.frame.width, height: idFBtn.frame.height)
        let subPath = UIBezierPath(roundedRect: rect, cornerRadius: 2)
        
        path.append(subPath)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        
        bgView.layer.mask = shapeLayer
        bgView.removeGestureRecognizer(tap)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClick2))
        tapGesture.cancelsTouchesInView = true
        bgView.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewClick2() {
        let frame = UIScreen.main.bounds
        let path = UIBezierPath(rect: frame)
        let x = (UIScreen.main.bounds.width - 240) / 2
        let rect = CGRect(x: x, y: 37, width: 240, height: 500)
        let subPath = UIBezierPath(roundedRect: rect, cornerRadius: 2)
        
        path.append(subPath)
        let shapeLayer = CAShapeLayer()
        scrollView.setContentOffset(CGPoint(x: 0, y: 448), animated: true)

        shapeLayer.path = path.cgPath
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        
        bgView.layer.mask = shapeLayer
    }
    
    
}

