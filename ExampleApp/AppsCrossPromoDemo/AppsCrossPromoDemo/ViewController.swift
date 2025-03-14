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
        let app1 = AppInfo(AppID: 2000000, name: "Game One", subtitle: "make and run love2d games", iconName: "game_one_icon", appStoreLink: "https://apps.apple.com/app/id123456")
        let app2 = AppInfo(AppID: 2000000, name: "Game Two Game Two Game Two Game Two Game Two Game Two Game Two", subtitle: "write and execute lua scripts write and execute lua scripts write and execute lua script swrite and execute lua scripts", iconName: "game_two_icon", appStoreLink: "https://apps.apple.com/app/id654321")

        // Add to Array
        let appsArray = [app1, app2]

        // Create ViewController
        let appsVC = AppsListViewController(appsArray: appsArray as NSArray)
        
        // Present it (assuming inside a navigation controller)
        self.present(appsVC, animated: true)
        
    }
    
}

