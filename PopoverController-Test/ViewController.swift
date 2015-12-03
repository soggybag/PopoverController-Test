//
//  ViewController.swift
//  PopoverController-Test
//
//  Created by mitchell hudson on 11/22/15.
//  Copyright © 2015 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    
    
    @IBAction func leftButtonTapped(sender: UIButton) {
        let popView = PopViewController()
        popView.modalPresentationStyle = .Popover
        popView.preferredContentSize = CGSizeMake(300, 300)
        
        if let popController = popView.popoverPresentationController {
            let sourceView = sender as UIView
            popController.permittedArrowDirections = .Up
            popController.sourceView = self.view
            let y = sourceView.center.y + sourceView.bounds.height / 2
            popController.sourceRect = CGRectMake(sourceView.center.x, y, 0, 0)
            popController.delegate = self
        }
        
        self.presentViewController(popView, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func centerButtonTapped(sender: AnyObject) {
        //
    }
    
    
    
    @IBAction func rightButtonTapped(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let popDate = storyboard.instantiateViewControllerWithIdentifier("PopDate") 
        popDate.modalPresentationStyle = .Popover
        popDate.preferredContentSize = CGSizeMake(300, 200)
        
        if let popDateController = popDate.popoverPresentationController {
            popDateController.permittedArrowDirections = .Up
            popDateController.sourceView = self.view
            let sourceView = sender as UIView
            popDateController.sourceRect = CGRect(x: sourceView.center.x, y: sourceView.center.y + sourceView.bounds.size.height / 2, width: 1, height: 1)
            popDateController.delegate = self
        }
        
        self.presentViewController(popDate, animated: true, completion: nil)
    }
    
    
    // MARK: Popover presentation delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func popoverPresentationController(popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverToRect rect: UnsafeMutablePointer<CGRect>, inView view: AutoreleasingUnsafeMutablePointer<UIView?>) {
        print("Will reposition popover")
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController) {
        print("Did Dismiss popover")
    }
    
    func popoverPresentationControllerShouldDismissPopover(popoverPresentationController: UIPopoverPresentationController) -> Bool {
        print("Should Dismiss popover")
        print(popoverPresentationController.popoverBackgroundViewClass)
        return true
    }
    
    
    
    // MARK: Navigation 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popHullo" {
            let popVC = segue.destinationViewController
            popVC.modalPresentationStyle = UIModalPresentationStyle.Popover
            popVC.popoverPresentationController?.delegate = self
        }
        
        if segue.identifier == "popHullo2" {
            let popVC = segue.destinationViewController
            popVC.modalPresentationStyle = UIModalPresentationStyle.Popover
            popVC.popoverPresentationController?.delegate = self
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

