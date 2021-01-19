//
//  TestViewController.swift
//  Route
//
//  Created by Nick on 1/7/21.
//

import UIKit

final class TestViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.distribution = .fill
        ["coat", "pants", "hat"].forEach {
            stackView.addArrangedSubview(getSizeStackView(with: $0))
        }
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        stackView
            .mLayChain(.centerY, .equal, view)
            .mLayChain(pin: .init(leading: 20, trailing: 20))
            .mLayChain(.height, 370)
    }
    
    private func getSizeStackView(with title: String) -> UIStackView {
        let aStackView: UIStackView = UIStackView()
        aStackView.axis = .vertical
        aStackView.alignment = .center
        aStackView.spacing = 10
        aStackView.distribution = .fill
        aStackView.backgroundColor = .purple

        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.text = title
        label.mLayChain(.height, 50)

        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.mLayChain(.height, 50)

        Size.allCases.forEach {
            let item = StackItem(with: title, size: $0)
            stackView.addArrangedSubview(item)
            item.mLayChain(.width, 50)
            item.mLayChain(.height, 50)
            item.addTarget(self, action: #selector(didTap(stackItem:)), for: .touchUpInside)
        }
    
        aStackView.addArrangedSubview(label)
        aStackView.addArrangedSubview(stackView)
        return aStackView
    }
    
    @objc
    private func didTap(stackItem: StackItem) {
        NLRoute.shared.route(to: stackItem.url)
    }

}
