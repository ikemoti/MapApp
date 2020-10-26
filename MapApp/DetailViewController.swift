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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            name.heightAnchor.constraint(equalToConstant: 40),
            name.widthAnchor.constraint(equalToConstant: 100)
        ])
        name.textColor = .black
        name.text = "テスト"
        
    }
    open func setData(text: String){
        name.text = text
    }
}
