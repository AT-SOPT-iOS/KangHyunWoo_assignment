//
//  SportsViewController.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//
import UIKit
import SnapKit

class SportsViewController: UIViewController {
    
    final let InterItemSpacing: CGFloat = 10
    final let cellHeight: CGFloat = 45
    final let cellWidth: CGFloat = 90
    
    private var sportsData = SportsData.dummy()
    
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
    private func setLayout(){
        [collectionView].forEach {
            view.addSubview($0)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(cellHeight)
        }
    }
    private func register() {
        collectionView.register(
            SportsCollectionViewCell.self,
            forCellWithReuseIdentifier: SportsCollectionViewCell.identifier)
    }
    private func setDelegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension SportsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return InterItemSpacing
    }
}

extension SportsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportsCollectionViewCell.identifier, for: indexPath) as? SportsCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.dataBind(sportsData[indexPath.item])
        return cell
    }
}

