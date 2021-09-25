//
//  VerticalViewController.swift
//  ScrollView-SnapKit-Sample
//
//  Created by Yus Inoue on 2021/09/24.
//

import UIKit
import SnapKit

final class VerticalViewController: UIViewController {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "縦方向の ScrollView"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = false
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    override func viewDidLoad() {
        
        contentView.addSubview(redView)
        contentView.addSubview(blueView)
        contentView.addSubview(yellowView)
        scrollView.addSubview(contentView)
        view.addSubview(headerLabel)
        view.addSubview(scrollView)
        
        redView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(view.frame.height)
        }
        blueView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(view.frame.height)
        }
        yellowView.snp.makeConstraints {
            $0.top.equalTo(blueView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(view.frame.height)
        }
        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView.frameLayoutGuide)       // 縦方向の Scroll の場合は Width に合わせる
            $0.edges.equalTo(scrollView.contentLayoutGuide)
        }
        headerLabel.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(100)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom)
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
