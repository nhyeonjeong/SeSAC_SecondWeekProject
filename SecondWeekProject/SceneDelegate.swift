//
//  SceneDelegate.swift
//  SecondWeekProject
//
//  Created by 남현정 on 2024/01/02.
//

import UIKit
/*
 iOS13미만에서는 AppDelegate만 있었음.한 화면에 하나의 앱만!
 iOS13에서 iPadOS가 등장하면서 씬델리게이트 만들어짐(그 이전 아이패드 OS도 iOS였음) 
 [이유]
 -> 같은 앱을 두 개씩 띄울 수 있게 되고 split도 생겨남
 -> 그러다 보니 생명주기가 복잡해지고 씬델리게이트가 나왔다.
 
 */

// @availabel , #available, @unavailable등등도 있다.
// UIWindow : 뷰컨트롤러를 window에 연결하는 것이었음, UIWindow가 화면을 전환하고 바꾸고 하는걸 감독, 아이폰에 바춰질 거울같은...

@available (iOS 13.0, *) // 여기서 하나만 쓰면 밑에 함수마다 쓰지 않아도 됨
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? // 실질적으로 보여주는 역할 / 아이폰에 뷰컨트롤러를 보여주는 역할 -> 이 또한 12버전이하에서는 무용지물. 원래 12이하에서는 앱델리게이트에 있었음

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    // 액티브상태를 떠났을 때
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    // 액티브상태가 됐을 때
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    // 앱이 다시 포그라운드상태에 들어왔을 때
    func sceneWillEnterForeground(_ scene: UIScene) {
        // 금융이나 보안이 중요한 앱인 경우, 다시 인증하는 기능
        // 카카오톡에 잠금이 있다면 잠금화면을 띄워주기
        // 유투브에서 걸제하라는 유도 페이지 팝업으로 띄우기
    }

    // 씬이 백그라운드에 들어갔을 때의 기능 - UI 라이프사이클 관리
    func sceneDidEnterBackground(_ scene: UIScene) {
        // 유투브 프리미엄 결제 여부에 따라 백그라운드일때 재생을 끊을지 말지 여기서 재생하거나 멈추는 기능
    }


}

