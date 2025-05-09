//
//  MainViewController.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupScrollView()
        setupStackView()
        addViews()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollView.addSubview(stackView)
    }
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    private func addViews(){
    let headerView = HeaderView()
    stackView.addArrangedSubview(headerView)
    headerView.snp.makeConstraints {
        $0.height.equalTo(55)
    }
        
    let TypeView = TypeView()
        stackView.addArrangedSubview(TypeView)
        TypeView.snp.makeConstraints{
            $0.height.equalTo(45)
        }

    let mainImageView = UIImageView(image: UIImage(named: "main"))
    mainImageView.contentMode = .scaleAspectFill
    mainImageView.clipsToBounds = true
    stackView.addArrangedSubview(mainImageView)
    mainImageView.snp.makeConstraints {
        $0.height.equalTo(400)
    }
        
        let topVC = TopViewController()
        let liveVC = LiveViewController()
        let popularVC = PopularViewController()
        let sportsVC = SportsViewController()
        let lifeVC = LifeViewController()
        
        [topVC,liveVC,popularVC,sportsVC, lifeVC].forEach {
            addView($0)
        }
    }
    private func addView(_ childVC : UIViewController){
        addChild(childVC)
        stackView.addArrangedSubview(childVC.view)
        childVC.didMove(toParent: self)
        
        if childVC is TopViewController {
            childVC.view.snp.makeConstraints {
                $0.height.equalTo(180)
            }
        }
        else if childVC is LiveViewController {
            childVC.view.snp.makeConstraints {
                $0.height.equalTo(170)
            }
        }
        else if childVC is PopularViewController {
            childVC.view.snp.makeConstraints {
                $0.height.equalTo(180)
            }
        }
        else if childVC is SportsViewController {
            childVC.view.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
        else if childVC is LifeViewController {
            childVC.view.snp.makeConstraints {
                $0.height.equalTo(140)
            }
        }
    }
}
    

