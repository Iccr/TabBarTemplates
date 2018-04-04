//
//  TablePickerViewController.swift
//  Sipradi
//
//  Created by shishir sapkota on 7/25/17.
//  Copyright © 2017 Ekbana. All rights reserved.
//

import UIKit

class TablePickerViewController: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    
    @IBOutlet weak var navbar: UINavigationBar!
    var data: [String] = []
    
    var allowMultipleSelection = false
    var allowSelection = true
    
    var doneAction: (([String]) -> ())?
    var defaultSelectedData: [String] = []
    
    var titleString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
//        self.navigationItem.title = titleString
        self.navbar.topItem?.title = titleString
    }
    

    
    private func setupTableView() {
        self.tableVIew.delegate = self
        self.tableVIew.dataSource = self
        self.tableVIew.separatorColor = UIColor.init(hex: "#DFDFDF")
        self.tableVIew.allowsMultipleSelection = self.allowMultipleSelection
        self.tableVIew.allowsSelection = self.allowSelection
    }
    
    // MARK: IBActions
    
    @IBAction func close(_ sender: Any?) {
        let selectedIndexPaths = self.tableVIew.indexPathsForSelectedRows ?? self.tableVIew.indexPathForSelectedRow.map({[$0]})
        let selectedData = selectedIndexPaths?.flatMap { indexPath -> String? in
            let value = data[indexPath.row]
            return value
        }
        self.doneAction?(selectedData ?? [])
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clear(_ sender: Any) {
        self.tableVIew.indexPathsForSelectedRows?.forEach({self.tableVIew.deselectRow(at: $0, animated: true)})
        self.tableVIew.indexPathForSelectedRow.map({self.tableVIew.deselectRow(at: $0, animated: true)})
        self.defaultSelectedData = []
        self.tableVIew.reloadData()
    }
    
}

extension TablePickerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        if !self.allowMultipleSelection {
            self.close(nil)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let onlyIndex = data[indexPath.row].components(separatedBy: " ").first ?? ""
        logger(onlyIndex)
        if defaultSelectedData.contains(onlyIndex) {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
    }
    
}

extension TablePickerViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVIew.dequeueReusableCell(withIdentifier: "TableViewPickerCell", for: indexPath)
        

        cell.textLabel?.text = data[indexPath.row]

        let onlyIndex = data[indexPath.row].components(separatedBy: " ").first ?? ""
        if defaultSelectedData.contains(onlyIndex) {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        
//        cell.accessoryType = isSelectedIndexPath ? .checkmark: .none
        
        return cell
    }
}
