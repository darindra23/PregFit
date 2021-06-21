//
//  File.swift
//  PregFit
//
//  Created by Dheo Gildas Varian on 21/06/21.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate{
    static var shared = NotificationManager()
    private override init() {}
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func userRequest() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) { (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
    }
    
    func scheduleNotificationForReminderTask() {
        let content = UNMutableNotificationContent()
        content.title = "WARNING!"
        content.body = "Your Heart Rate exceeded 140 BPM. Consider toning down or taking a momentary break."
        content.sound = UNNotificationSound.default
        
        //        let date = Date()
        //        let triggerDate = Calendar.current.dateComponents([.day], from: date)
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let identifier = "Reminder Task"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("error \(error.localizedDescription)")
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.sound, .badge, .banner])
    }
}
