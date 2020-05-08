//
//  DefaultViewController.swift
//  Tutorial
//
//  Created by jackercleaning on 2018/12/12.
//  Copyright © 2018 Charles Chien. All rights reserved.
//

import UIKit
import Instructions

class DefaultViewController: UIViewController, CoachMarksControllerDataSource, CoachMarksControllerDelegate {
    @IBOutlet weak var idFBtn: UIButton!
    @IBOutlet weak var idBBtn: UIButton!
    @IBOutlet weak var otherView: UIView!
    @IBOutlet weak var scrollerView: UIScrollView!
    @IBOutlet weak var back: UIBarButtonItem!
    
    let coachMarksController = CoachMarksController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.coachMarksController.dataSource = self
        coachMarksController.overlay.allowTap = true
        coachMarksController.overlay.color = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        let skipView = CoachMarkSkipDefaultView()
        skipView.setTitle("Skip", for: .normal)
        
        self.coachMarksController.skipView = skipView
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.coachMarksController.start(on: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.coachMarksController.stop(immediately: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 4
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: CoachMark) -> (bodyView: CoachMarkBodyView, arrowView: CoachMarkArrowView?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, arrowOrientation: coachMark.arrowOrientation)
        if index == 3 {
            self.navigationController?.popViewController(animated: true)
        }else {
            coachViews.bodyView.hintLabel.text = "上傳證件照片"
            coachViews.bodyView.nextLabel.text = "確定"
        }
        
        
        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {

        switch index {
        case 0:
            return coachMarksController.helper.makeCoachMark(for: idFBtn)
        case 1:
            return coachMarksController.helper.makeCoachMark(for: idBBtn)
        case 2:
            scrollerView.setContentOffset(CGPoint(x: 0, y: 448), animated: true)
            let coachMark = coachMarksController.helper.makeCoachMark(for: self.view) {
                (frame: CGRect) -> UIBezierPath in
                // This will create an oval cutout a bit larger than the view.
                let x = (UIScreen.main.bounds.width - 240) / 2

                let rect = CGRect(x: x, y: 100, width: 240, height: 500)
                let path = UIBezierPath(rect: rect)
                return path
            }
            return coachMark

        default:
            return coachMarksController.helper.makeCoachMark()

        }
    }
    
    
}
