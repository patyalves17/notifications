//
//  ViewController.swift
//  Notificacoes
//
//  Created by Usuário Convidado on 11/10/17.
//  Copyright © 2017 Usuário Convidado. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var dpFireDate: UIDatePicker!
    @IBOutlet weak var lbMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dpFireDate.minimumDate = Date()
    }

    // MARK: - IBActions
    @IBAction func fireNotification(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "Lembrete"
        content.subtitle = "Vim lembrar-lhe de: "
        content.body = tfMessage.text!
        //content.sound = UNNotificationSound(named: "arquivo-de-som.caf")
        content.categoryIdentifier = "Lembrete"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "Lembrete", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}






