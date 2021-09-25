//
//  HorizontalViewController.swift
//  ScrollView-SnapKit-Sample
//
//  Created by Yus Inoue on 2021/09/24.
//

import UIKit
import SnapKit

final class HorizontalViewController: UIViewController {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "横方向の ScrollView\n(チュートリアル画面風)"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
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
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.numberOfPages = 3
        return pageControl
    }()

    override func viewDidLoad() {
        
        contentView.addSubview(redView)
        contentView.addSubview(blueView)
        contentView.addSubview(yellowView)
        scrollView.addSubview(contentView)
        view.addSubview(headerLabel)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        redView.snp.makeConstraints {
            $0.top.bottom.left.equalToSuperview()
            $0.width.equalTo(view.frame.width)
        }
        blueView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(redView.snp.right)
            $0.right.equalTo(yellowView.snp.left)
            $0.width.equalTo(view.frame.width)
        }
        yellowView.snp.makeConstraints {
            $0.top.bottom.right.equalToSuperview()
            $0.left.equalTo(blueView.snp.right)
            $0.width.equalTo(view.frame.width)
        }
        contentView.snp.makeConstraints {
            $0.height.equalTo(scrollView.frameLayoutGuide)       // 横方向の Scroll の場合は height を frameLayoutGuide に合わせる
            $0.edges.equalTo(scrollView.contentLayoutGuide)
        }
        headerLabel.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(100)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom)
            $0.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(pageControl.snp.top)
        }
        pageControl.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(15)
        }
    }
}

extension HorizontalViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
