//
//  ViewController.swift
//  PushNotifications
//
//  Created by Nguyen Quang Ha on 03/10/2022.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestPermision()
        addView()
    }
    
    private func requestPermision() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, err) in
                    print("granted: (\(granted)")
        }
    }
    
    private func addView() {
        addButton()
    }
    
    func addButton() {
        let button = UIButton(frame:CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.configuration = createConfig()
        button.addTarget(self, action: #selector(self.buttonClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func createConfig() -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemGreen
        config.title = "Tap me"
        config.titleAlignment = .center
        return config
    }
    
    @objc func buttonClick(sender: UIButton) {
        print("Clicked")
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.body = "Look for the app ID you just created in Xcode"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "Quang-Ha.PushNotifications", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

