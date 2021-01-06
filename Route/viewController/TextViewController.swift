//
//  TextViewController.swift
//  Route
//
//  Created by Nick on 1/7/21.
//

import UIKit

final class TextViewController: UIViewController {

    private let textLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 50)
        label.textColor = .black
        return label
    }()
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        textLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textLabel)
        textLabel.mLayChainCenterXY()
    }
    
}
