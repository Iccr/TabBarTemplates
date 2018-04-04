//
//  TableViewPickerWithIndexViewController.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//


import UIKit

class TableViewPickerWithIndexViewController: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    
    var data: [String] = []
    
    var allowMultipleSelection = false
    var allowSelection = true
    
    var doneAction: (([String]) -> ())?
    var defaultSelectedData: [String] = []
    
    fileprivate var keys = [String]()
    fileprivate var keyValues = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getKeys()
        self.setupTableView()
    }
    
    private func getKeys() {
        let keys = self.data
            .flatMap { value in
                return value.characters.first.map({String($0).uppercased()})
        }
        
        self.keys = Set(keys).sorted(by: <)
        self.keyValues = keys.reduce([String: [String]](), { (result, key) -> [String: [String]] in
            let data = self.data.filter({$0.uppercased().hasPrefix(key)})
            var result = result
            result[key] = data
            return result
        })
    }
    
    private func setupTableView() {
        self.tableVIew.delegate = self
        self.tableVIew.dataSource = self
        
        self.tableVIew.allowsMultipleSelection = self.allowMultipleSelection
        self.tableVIew.allowsSelection = self.allowSelection
    }
    
    // MARK: IBActions
    
    @IBAction func close(_ sender: Any?) {
        let selectedIndexPaths = self.tableVIew.indexPathsForSelectedRows ?? self.tableVIew.indexPathForSelectedRow.map({[$0]})
        let selectedData = selectedIndexPaths?.flatMap { indexPath -> String? in
            let key = self.keys[indexPath.section]
            let value = self.keyValues[key]?[indexPath.row]
            return value
        }
        self.doneAction?(selectedData ?? [])
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clear(_ sender: Any) {
        self.tableVIew.indexPathsForSelectedRows?.forEach({self.tableVIew.deselectRow(at: $0, animated: true)})
        self.tableVIew.indexPathForSelectedRow.map({self.tableVIew.deselectRow(at: $0, animated: true)})
        self.tableVIew.reloadData()
    }
    
}

extension TableViewPickerWithIndexViewController: UITableViewDelegate {
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
        self.defaultSelectedData.enumerated().flatMap({ selectedData -> IndexPath? in
            
            defaultSelectedData.remove(at: selectedData.offset)
            let selectedElement = selectedData.element
            
            guard let key = selectedElement.characters.first.map({
                String($0)
            }) else {return nil}
            
            if let section = self.keys.index(of: key), let row = keyValues[key]?.index(of: selectedElement) {
                return IndexPath(row: row, section: section)
            }
            return nil
        }).forEach { (indexPath) in
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
    }
    
}

extension TableViewPickerWithIndexViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        
        return keyValues[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVIew.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let key = keys[indexPath.section]
        let value = keyValues[key]?[indexPath.row]
        cell.textLabel?.text = value
        let isSelectedIndexPath = tableView.indexPathsForSelectedRows?.contains(indexPath) ?? (tableView.indexPathForSelectedRow == indexPath)
        
        cell.accessoryType = isSelectedIndexPath ? .checkmark: .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.keys[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.keys
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
