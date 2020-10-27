//
//  DetailViewController.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/25.
//

import UIKit

//破棄したタイミングでピン選択終了
//URLからSAFARI飛ぶ
//
public class DetailViewController: UIViewController {
    let name: UILabel = .init()
    public let text = String()
    private let tableView: UITableView = .init()
    private let button: UIButton = .init()
    
//    let testData: Sauna = .init(name: <#T##String#>, address: <#T##String#>, openTime: <#T##String#>, closeTime: <#T##String#>, timeException: <#T##String?#>, url: <#T##String#>)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        setUp()
        
    }
    open func setData(text: String?){
        name.text = text
    }
    
    func setUp(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 125)
        ])
        name.textColor = .black
        name.text = "テスト"
        tableView.backgroundColor = .green
        
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
       return 5
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
        
    }
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
        .dequeueReusableCell(withIdentifier: "Cell") as? Cell
            else { fatalError("cell is not defined sucessfully") }
        
        return cell
    }
}
