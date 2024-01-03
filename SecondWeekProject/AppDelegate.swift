//
//  AppDelegate.swift
//  SecondWeekProject
//
//  Created by 남현정 on 2024/01/02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? // 12버전이하를 대응하려면 씬델리게이트에서 써준 것처럼 여기서 써줘야 검은화면이 뜨지 않는다.
    
    // 런치스크린?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 런치스크린 끝나면 return true
        return true
    }

    // MARK: UISceneSession Lifecycle
    // available?
    @available (iOS 13.0, *) // 13버전이상에서만 이 함수를 사용가능하도록, *로 표시하는 이유는 13.0이상의 모든것을 포괄하겠다는 의미
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role) // 씬델리게이트에 넘겨주는 작업
    }

    // 정리기능?함수
    @available (iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    // 이 기능의 함수도 씬델리게이트로 넘어감. 아이패드에 대응할게 아니라면 씬없애고 이 함수 여기서 써도 가능
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        <#code#>
//    }

}

