//
//  SideMenuTableViewController.swift
//  SnowSideMenuSwift
//
//  Created by SN on 15/6/25.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

protocol SideMenuTableViewDelegate {
    func sideMenu(didSelectItem itemNo: Int)
}

class SideMenuTableViewController: UITableViewController {
    
    // 当前大类
    var currentItem: Int?
    var delegate: SideMenuTableViewDelegate?
    
    // 大类
    var itemArr = [1,2,3,4,5,6,7,8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        
        initTableView()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 数据初始化
    func initData() {
        
        
    }
    
    // tableView初始化
    func initTableView() {
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.backgroundColor = UIColor.lightGrayColor()
        tableView.scrollsToTop = false
        tableView.scrollEnabled = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        //注册TableViewCellID
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArr.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = "\(itemArr[indexPath.row])"
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    
    
    // MARK: - table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.textLabel?.textColor = UIColor.yellowColor()
        self.currentItem = itemArr[indexPath.row]
        delegate?.sideMenu(didSelectItem: self.currentItem!)
        
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.textLabel?.textColor = UIColor.whiteColor()
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}