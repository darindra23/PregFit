//
//  File.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 21/06/21.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate{
    
    func userRequest() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) { (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
    }
}
