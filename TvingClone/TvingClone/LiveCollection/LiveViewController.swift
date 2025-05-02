//
//  LiveViewController.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit
import SnapKit

class LiveViewController: UIViewController {
    
    final let InterItemSpacing: CGFloat = 10
    final let cellHeight: CGFloat = 138
    final let cellWidth: CGFloat = 160
    
    private var liveData = LiveData.dummy()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 LIVE"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
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
        [titleLabel, collectionView].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(15)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.height.equalTo(cellHeight)
        }
    }
    private func register() {
        collectionView.register(
            LiveCollectionViewCell.self,
            forCellWithReuseIdentifier: LiveCollectionViewCell.identifier)
    }
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension LiveViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return InterItemSpacing
    }
}

extension LiveViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return liveData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveCollectionViewCell.identifier, for: indexPath) as? LiveCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.dataBind(liveData[indexPath.item])
        return cell
    }
}

