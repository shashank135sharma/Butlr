//
//  ListManager.swift
//  Butlr
//
//  Created by Shashank Sharma on 9/24/16.
//  Copyright © 2016 Shashank Sharma. All rights reserved.
//

import Foundation
import UIKit

class ListManager {
    static let sharedInstance = ListManager();
    let defaults = NSUserDefaults.standardUserDefaults();
    var tasksList = [String: [String]]();
    var descriptionList = [String: String]();
    var dateList = [String: NSDate]();
    var listOfLocationsNamekey = "ListOfLocations";
    var descriptionNameKey = "descriptionsList";
    var dateNameKey = "datesList";
    
    var currentLocation = "";
    var currentTask = "";
    var defaultsArray = [[String: AnyObject]]();
    
    func addTaskToList(LocationName: String, TaskName: String) -> Void {
        tasksList[LocationName]?.append(TaskName);
        defaults.setObject(tasksList, forKey: listOfLocationsNamekey);
        defaults.synchronize()
    }
    
    func addDescription(taskName: String, description: String) {
        print(descriptionList[taskName])
        defaults.setObject(descriptionList, forKey: descriptionNameKey);
        updateDescriptionList()
        defaults.synchronize()
    }

    func addDateToList(TaskName: String, date: NSDate) {
        dateList[TaskName] = date;
        defaults.setObject(dateList, forKey: dateNameKey);
        updateDateList()
        defaults.synchronize()
    }
    
    func addLocation(LocationName: String) {
        tasksList[LocationName] = [];
        defaults.setObject(tasksList, forKey: listOfLocationsNamekey);
        updateTaskList()
        defaults.synchronize()
    }
    
    func getListByLocation(LocationName: String) -> [String]? {
        tasksList = defaults.dictionaryForKey(listOfLocationsNamekey) as! [String: [String]];
        return tasksList[LocationName];
    }

    func getTasksList() -> [String: [String]] {
        updateTaskList()
        return tasksList;
    }
    
    func getDescriptionList() -> [String: String] {
        updateDescriptionList()
        return descriptionList;
    }
    
    func getDateList() -> [String: NSDate] {
        updateDateList()
        return dateList
    }
    
    func getTasksRemaining(location: String) -> Int{
        return (tasksList[location]?.count)!;
    }
    
    func removeTaskAtIndex(index: Int) {
        tasksList[currentLocation]?.removeAtIndex(index);
        
    }
    
    func getDateByTaskName(taskName: String) -> NSDate{
        if (dateList[taskName] == nil) {
            return NSDate();
        }
        return dateList[taskName]!;
    }
    
    func getDescriptionByTaskName(taskName: String) -> String {
        if (descriptionList[taskName] == nil) {
            return "";
        }
        return descriptionList[taskName]!;
    }
    
    func updateTaskList() {
        if (defaults.dictionaryForKey(listOfLocationsNamekey)) != nil {
            tasksList = defaults.dictionaryForKey(listOfLocationsNamekey) as! [String: [String]];
        }
        defaults.synchronize()
    }
    
    func updateDescriptionList() {
        if(defaults.dictionaryForKey(descriptionNameKey) != nil) {
            descriptionList = (defaults.dictionaryForKey(descriptionNameKey) as! [String: String]);
        }
        defaults.synchronize()
    }
    
    func updateDateList() {
        if(defaults.dictionaryForKey(dateNameKey) != nil) {
            dateList = defaults.dictionaryForKey(dateNameKey) as! [String: NSDate];
        }
        defaults.synchronize()
    }
}
