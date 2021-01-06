//
//  StackItem.swift
//  Route
//
//  Created by Nick on 1/7/21.
//

import UIKit

final class StackItem: UIControl {
    
    let url: URL
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .red
        return label
    }()

    init(with title: String, size: Size) {
        self.url = URL(string: "/\(title)/\(size.rawValue)")!
        super.init(frame: .zero)
        titleLabel.text = size.rawValue
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.mLayChain(pin: .init(top: 5, left: 5, bottom: 5, right: 5))
    }
    
}
