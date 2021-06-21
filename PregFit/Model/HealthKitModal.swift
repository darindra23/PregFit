//
//  HealthKit.swift
//  PregFit
//
//  Created by Olivia Dwi  Susanti on 20/06/21.
//

import Foundation
import HealthKit
import UIKit

let healthKitStore : HKHealthStore = HKHealthStore()

class HealthKitModal {
    var timer : Timer!
    var rate : [Double] = []
    var time : [Int] = []
    var detik = 0
    
    func authorizeHealthKitInApp() {
        let healthKitTypesToRead : Set<HKObjectType> = [HKObjectType.quantityType(forIdentifier: .heartRate)!]
        let healthKitTypesToWrite : Set<HKSampleType> = []
        if !HKHealthStore.isHealthDataAvailable() {
            print("Error occured")
            return
        }
        healthKitStore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) -> Void in
            print("Read Write Authorization succeded")
        }
    }
    
    func startMockHeartData() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(subscribeToHeartBeatChanges),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func subscribeToHeartBeatChanges(){
        // Creating the sample for the heart rate
        
        guard let sampleType: HKSampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        /// Creating an observer, so updates are received whenever HealthKit’s
        // heart rate data changes.
        HKObserverQuery.init(sampleType: sampleType, predicate: nil) { (sample, _, error) in
            self.fetchLatestHeartRateSample(completion: { (sample) in
                let heartRateUnit = HKUnit(from: "count/min")
                let hasil = sample?.quantity.doubleValue(for: heartRateUnit)
            })
        }
        /// When the completion is called, an other query is executed
        /// to fetch the latest heart rate
        fetchLatestHeartRateSample(completion: { sample in
            guard let sample = sample else {
                return
            }
            /// The completion in called on a background thread, but we
            /// need to update the UI on the main.
            DispatchQueue.main.async {
                /// Converting the heart rate to bpm
                let heartRateUnit = HKUnit(from: "count/min")
                let heartRate = sample
                    .quantity
                    .doubleValue(for: heartRateUnit)
                /// Updating the UI with the retrieved value
                
                self.rate.append(heartRate)
                self.time.append(self.detik)
                self.detik+=1
                print(heartRate)
                
                if heartRate > 140{
                    NotificationManager.shared.scheduleNotificationForReminderTask()
                    //self.showAlert()
                    self.stopMockHeartData()
                }
            }
        })
    }
    
    func fetchLatestHeartRateSample(
        completion: @escaping (_ sample: HKQuantitySample?) -> Void) {
        /// Create sample type for the heart rate
        guard let sampleType = HKObjectType
                .quantityType(forIdentifier: .heartRate) else {
            completion(nil)
            return
        }
        /// Predicate for specifiying start and end dates for the query
        let predicate = HKQuery
            .predicateForSamples(
                withStart: Date.distantPast,
                end: Date(),
                options: .strictEndDate)
        /// Set sorting by date.
        let sortDescriptor = NSSortDescriptor(
            key: HKSampleSortIdentifierStartDate,
            ascending: false)
        /// Create the query
        let query = HKSampleQuery(
            sampleType: sampleType,
            predicate: predicate,
            limit: Int(HKObjectQueryNoLimit),
            sortDescriptors: [sortDescriptor]) { (_, results, error) in
            guard error == nil else {
                print("Error: \(error!.localizedDescription)")
                return
            }
            completion(results?[0] as? HKQuantitySample)
        }
        healthKitStore.execute(query)
    }
    
    func readHeartRate(heartRate: HKHeartRateMotionContext?) -> Int {
        
        return heartRate!.rawValue
    }
    
    func stopMockHeartData() {
        self.timer?.invalidate()
    }
    
    func showAlertT(on vc:UIViewController, with title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    func showMessage(title: String, msg: String, `on` controller: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(){
        let instructions = "Your Heart Rate exceeded 140 BPM. Consider toning down or taking a momentary break."
        let alert = UIAlertController(title: "WARNING!", message: instructions, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        UIApplication.topViewController()?.present(alert, animated: false, completion: nil)
        //        present(alert, animated: true)
        //        DispatchQueue.main.async {
        //            alert.present(TabBarViewController(), animated: true, completion: nil)
        //            UIViewController().present(alert, animated: true, completion: nil)
        //        }
        //        alert.present(alert, animated: true)
    }
    
}

//extension UIApplication {
//  class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//    if let tabController = controller as? UITabBarController {
//      return topViewController(controller: tabController.selectedViewController)
//    }
//    if let navController = controller as? UINavigationController {
//      return topViewController(controller: navController.visibleViewController)
//    }
//    if let presented = controller?.presentedViewController {
//      return topViewController(controller: presented)
//    }
//    return controller
//  }
//}
