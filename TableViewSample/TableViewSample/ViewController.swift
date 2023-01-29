//
//  ViewController.swift
//  TableViewSample
//
//  Created by Jason on 2023/01/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = sampleTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self.dataSource
        
        tableView.rowHeight = 100
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showAlert(indexPath: indexPath)
        // 사용자와의 상호작용했을때를 보기 위해서 delegate method이다.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func showAlert(indexPath: IndexPath) {
        let alertTitle = "어머나"
        let alertMessage = "날 만졌어\n \(indexPath.section), \(indexPath.row)"
        let actionTitle = "그랬구나"
        let alert = UIAlertController(title: alertTitle,
                                      message: alertMessage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}

class sampleTableViewDataSource: NSObject, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "tableVIewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        //MARK: - https://zeddios.tistory.com/1206 1205번도 봐야한다! textLabel 14이상에서 지원X
        //cell.textLabel?.text = "\(indexPath.section), \(indexPath.row)"
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = "\(indexPath.section), \(indexPath.row)"
        cell.contentConfiguration = cellContent
        
        
        return cell
    }
    
    
}
