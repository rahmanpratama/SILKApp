//
//  HomeProductCollectionView.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/9/23.
//

import Foundation
import UIKit
import SnapKit

class HomeProductCollectionView: UIView{
    
    
    var backgroundCellStyle: UIColor = Color.darkBlue
    var categoryList: [String] = ["All Product", "Layanan Kesehatan", "Alat Kesehatan"]
    let listCategory: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(ProductCategoryCell.self, forCellWithReuseIdentifier: "categoryCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createView()
    }
    
    private func createView(){
        backgroundColor = .white
        addSubview(listCategory)
        listCategory.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(30)
            make.bottom.equalToSuperview()
        }
        
        listCategory.dataSource = self
        listCategory.delegate = self
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        listCategory.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
    }
}

// MARK: CollectionView Delegate
extension HomeProductCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)

        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! ProductCategoryCell
        cell.titleLabel.text = categoryList[indexPath.row]
        cell.backgroundStyle = backgroundCellStyle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
    
}
