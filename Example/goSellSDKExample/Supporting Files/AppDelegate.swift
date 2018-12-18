//
//  AppDelegate.swift
//  goSellSDKExample
//
//  Copyright © 2018 Tap Payments. All rights reserved.
//

import class    Crashlytics.Crashlytics
import class    Fabric.Fabric
import class    goSellSDK.goSellSDK
import class    goSellSDK.SecretKey
import class    UIKit.UIApplication.UIApplication
import protocol UIKit.UIApplication.UIApplicationDelegate
import class    UIKit.UIResponder.UIResponder
import class    UIKit.UIWindow.UIWindow

@UIApplicationMain
internal class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?
    
    internal func applicationDidFinishLaunching(_ application: UIApplication) {
        
        Fabric.with([Crashlytics.self])
        
        Serializer.markAllCustomersAsSandboxIfNotYet()
        
        goSellSDK.secretKey = SecretKey(sandbox:    "sk_test_IpaGWuwyK9nNSQX8Cb47l0kg",
                                        production: "sk_live_uh9nzNxZl4JS0E3bDRgpvGmQ")
    }
}