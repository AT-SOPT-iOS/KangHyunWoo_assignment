//
//  PopularViewController.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//
import UIKit
import SnapKit

class PopularViewController: UIViewController{
    
    final let InterItemSpacing: CGFloat = 10
    final let cellHeight: CGFloat = 146
    final let cellWidth: CGFloat = 98
    
    private var popularData = PopularData.dummy()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 영화"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private let moreLabel : UILabel = {
        let label = UILabel()
        label.text = "더보기"
        label.textColor = .gray2
        label.font = UIFont(name : "Pretendard-Medium", size:15)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        return collectionView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setLayout()
        register()
        setDelegate()
    }
    
    private func setLayout() {
        [titleLabel, moreLabel,collectionView].forEach{
            view.addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(15)
        }
        moreLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.height.equalTo(cellHeight)
        }
    }
    
    private func register() {
        collectionView.register(
            PopularCollectionViewCell.self,
            forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
    }
    private func setDelegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension PopularViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.dataBind(popularData[indexPath.item])
        return cell
    }
}
extension PopularViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return InterItemSpacing
    }
}
