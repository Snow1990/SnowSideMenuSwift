//
//  ViewController.swift
//  SnowSideMenuSwift
//
//  Created by SN on 15/6/25.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SideMenuTableViewDelegate, SnowSideMenuDelegate {
    
    

    @IBAction func sideMenu(sender: UIBarButtonItem) {
        self.sideMenu?.toggleMenu()
    }
    // 抽屉效果
    var sideMenu: SnowSideMenu?
    var sideMenuViewController = SideMenuTableViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initSideMenu()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: SideMenu初始化
    func initSideMenu() {
        sideMenu = SnowSideMenu(sourceView: self.view, menuViewController: sideMenuViewController, menuPosition: .Left)
        sideMenu?.delegate = self
        sideMenuViewController.delegate = self
        
        
        
        // make navigation bar showing over side menu
        view.bringSubviewToFront(self.navigationController!.navigationBar)
    }
    
    // MARK: - 抽屉效果表格委托
    // 点击某个大类
    func sideMenu(didSelectItem itemNo: Int) {
        
        
        // 设置左上角名称
        self.navigationItem.leftBarButtonItem?.title = "\(itemNo)"
        // 关闭抽屉
        self.sideMenu?.toggleMenu(false)
        
    }
    // MARK: - 抽屉效果委托
    func sideMenuWillOpen() {
        println("sideMenuWillOpen")
    }
    func sideMenuWillClose() {
        println("sideMenuWillClose")
    }
    func sideMenuShouldOpenSideMenu () -> Bool {
        return true
    }
    
    
}

