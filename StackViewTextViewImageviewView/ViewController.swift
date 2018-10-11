//
//  ViewController.swift
//  StackViewTextViewImageviewView
//
//  Created by Daniyal Yousuf on 10/10/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dataSource: [String] = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt END!"]
    @IBOutlet weak var baseTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        baseTableView.estimatedRowHeight = 77
        baseTableView.rowHeight = UITableView.automaticDimension
        baseTableView.register(UINib.init(nibName: "CellB", bundle: nil), forCellReuseIdentifier: "cellb")
        baseTableView.register(UINib.init(nibName: "DynamicallyIncreasingheight", bundle: nil), forCellReuseIdentifier: "cellc")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let defaultCellB = tableView.dequeueReusableCell(withIdentifier: "cellb") as! CellB
            defaultCellB.setTextViewText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui offics END"
            return defaultCellB
            
        } else if indexPath.row == 1 {
            let defaultCellB = tableView.dequeueReusableCell(withIdentifier: "cellb") as! CellB
            defaultCellB.setTextViewText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco END"
            return defaultCellB
            
        } else if indexPath.row == 2 {
            
            let cellC = tableView.dequeueReusableCell(withIdentifier: "cellc") as! DynamicallyIncreasingheight
            cellC.textView = dataSource[0]
            cellC.delegate = self
            return cellC
            
            
        }
        else {
            var defaultCell = tableView.dequeueReusableCell(withIdentifier: "cella")
            if defaultCell == nil {
                defaultCell = UITableViewCell.init(style: .default, reuseIdentifier: "cella")
            }
            
             return defaultCell!
            
        }
    }
}

extension ViewController: DynamicallyIncreasingheightDelegate {
    
    func didtapAdd(text: String, cell: UITableViewCell) {
        dataSource[0] = text
        let celltoReload = cell
        let indexPath: IndexPath = baseTableView.indexPath(for: celltoReload)!
        baseTableView.reloadRows(at: [indexPath], with: .none)
        
    }
    
}




