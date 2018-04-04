//
//  LocalizationViewController.swift
//  Tsukasa
//
//  Created by Lizan Pradhanang on 8/16/17.
//  Copyright © 2017 Lizan Pradhanang. All rights reserved.
//

import UIKit
import Localize_Swift

class LocalizationViewController: UIViewController {
    
    var languages = Localize.availableLanguages()
    var languageArray = [(String,String)]()
    
    struct Constants {
        static let cellHeight: CGFloat = 48.0
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "text_language_setting".localized()
        NotificationCenter.default.addObserver(self, selector: #selector(self.setText), name: NSNotification.Name(LCLLanguageChangeNotification), object: nil)
    }
    
    @objc func setText() {
        languageArray = [("eng", "text_english_language".localized()), ("ja","text_japanese_language".localized())]
    }

}

extension LocalizationViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell") as! LanguageCell
        let language = languageArray[indexPath.row]
        cell.language = language.1
        cell.choosen = Localize.currentLanguage() == language.0
        cell.setup()
        return cell
    }
}

extension LocalizationViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Localize.setCurrentLanguage(languageArray[indexPath.row].0)
        self.title = "text_language_setting".localized()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
}


