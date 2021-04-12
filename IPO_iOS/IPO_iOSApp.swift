//
//  IPO_iOSApp.swift
//  IPO_iOS
//
//  Created by Ivanov Ivan on 03.03.2021.
//
//

import SwiftUI
import Firebase

@main
struct IPO_iOSApp: App {
    let persistenceController = PersistenceController.shared
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var viewRouter: ViewRouter = ViewRouter()
    @StateObject var viewRouterForTransactions: ViewRouterTransactions = ViewRouterTransactions()
    @StateObject var mainScreenRouter : MainScreenRouter = MainScreenRouter()

    var body: some Scene {
        WindowGroup {

            let localStorage : LocalStorage = LocalStorage()
            if (localStorage.getFromLocalStorage() == "visited")  {
                MainView(viewRouter: viewRouter,viewRouterForTransactions: viewRouterForTransactions)
            } else {
                MainScreenView(mainScreenRouter: mainScreenRouter)
            }
           // MainView(viewRouter: viewRouter, viewRouterForTransactions: viewRouterForTransactions)
             //   .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        
        //Setting Up Cloud Messaging
        
        Messaging.messaging().delegate = self
        Messaging.messaging().subscribe(toTopic: "IPO") { error in
          print("Subscribed")
        }
        Messaging.messaging().subscribe(toTopic: "SPAC") { error in
          print("Subscribed")
        }
        Messaging.messaging().subscribe(toTopic: "STOCK") { error in
          print("Subscribed")
        }
 
        
        //Setting Up Notifications
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        } else {
          let settings: UIUserNotificationSettings =
          UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()

        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      
      // Do Something With Message Data Here...
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      // Print full message.
      print(userInfo)

      completionHandler(UIBackgroundFetchResult.newData)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
    }
}

//Cloud Messaging
extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      let dataDict:[String: String] = ["token": fcmToken ?? ""]
      
        //Store token in Firestore For Sending Notificztions Form Server in Future...
        
        print(dataDict)
    }
}


//User Notificaions
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {

  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo

    //Do smth with message data

    print(userInfo)

    // Change this to your preferred presentation option
    completionHandler([[.banner,.badge, .sound]])
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo

    //Do smth with message data

    print(userInfo)

    completionHandler()
  }
}
