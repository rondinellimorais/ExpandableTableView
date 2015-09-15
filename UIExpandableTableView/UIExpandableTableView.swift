//
//  UIExpandableTableView.swift
//  LabelTeste
//
//  Created by Rondinelli Morais on 11/09/15.
//  Copyright (c) 2015 Rondinelli Morais. All rights reserved.
//

import UIKit

class UIExpandableTableView : UITableView, HeaderViewDelegate {
    
    var sectionOpen:Int = NSNotFound
    
    // MARK: HeaderViewDelegate
    func headerViewOpen(section: Int) {
        
        if self.sectionOpen != NSNotFound {
            headerViewClose(self.sectionOpen)
        }
        
        self.sectionOpen = section
        var numberOfRows = self.dataSource?.tableView(self, numberOfRowsInSection: section)
        var indexesPathToInsert:[NSIndexPath] = []
        
        for var i = 0; i < numberOfRows; i++ {
            indexesPathToInsert.append(NSIndexPath(forRow: i, inSection: section))
        }
        
        if indexesPathToInsert.count > 0 {
            self.beginUpdates()
            self.insertRowsAtIndexPaths(indexesPathToInsert, withRowAnimation: UITableViewRowAnimation.Automatic)
            self.endUpdates()
        }
    }
    
    func headerViewClose(section: Int) {
        
        var numberOfRows = self.dataSource?.tableView(self, numberOfRowsInSection: section)
        var indexesPathToDelete:[NSIndexPath] = []
        self.sectionOpen = NSNotFound
        
        for var i = 0 ; i < numberOfRows; i++ {
            indexesPathToDelete.append(NSIndexPath(forRow: i, inSection: section))
        }
        
        if indexesPathToDelete.count > 0 {
            self.beginUpdates()
            self.deleteRowsAtIndexPaths(indexesPathToDelete, withRowAnimation: UITableViewRowAnimation.Top)
            self.endUpdates()
        }
    }
}
