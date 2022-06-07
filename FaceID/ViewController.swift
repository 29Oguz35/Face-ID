//
//  ViewController.swift
//  FaceID
//
//  Created by naruto kurama on 25.05.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    private let authContext = LAContext()

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        
        var error : NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
             authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you", reply: { success, error in
                 if success == true {
                     DispatchQueue.main.async {
                         self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                     }
                 }else {
                     DispatchQueue.main.async {
                         self.textLabel.text = "ERROR!"
                     }
                 }
            })
            
        }
    }
    
}

