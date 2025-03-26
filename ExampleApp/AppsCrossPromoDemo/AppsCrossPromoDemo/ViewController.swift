//
//  ViewController.swift
//  AppsCrossPromoDemo
//
//  Created by cuipanjun on 2025/3/13.
//

import UIKit

import AppsCrossPromo

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func go2AppList(_ sender: Any) {
        
        // Create apps list
        let app1 = AppInfo(AppID: 638219114,
                           name: "LuaLu REPL",
                           subtitle: "Learn Lua Coding. It's not luau!",
                           iconName: "LuaLuApp",
                           appStoreLink: "https://apps.apple.com/us/app/lualu-repl-learn-lua-coding/id638219114")
        let app2 = AppInfo(AppID: 6476174098,
                           name: "Love2D Game Maker",
                           subtitle: "develop and run Love2D games",
                           iconName: "Love2DGM",
                           appStoreLink: "https://apps.apple.com/us/app/love2d-game-maker/id6476174098")
        let app3 = AppInfo(AppID: 6498889447,
                           name: "Solar2D Studio - CoronaSDK",
                           subtitle: "Make Apps/Games on your phone using Lua!",
                           iconName: "Solar2DStudio",
                           appStoreLink: "https://apps.apple.com/us/app/solar2d-studio-coronasdk/id6498889447")

        // Add to Array
        let appsArray = [app1, app2, app3]

        // Create ViewController
        let appsVC = AppsListViewController(appsArray: appsArray as NSArray)
        
        // Present it (assuming inside a navigation controller)
        self.present(appsVC, animated: true)
        
    }
    
}

