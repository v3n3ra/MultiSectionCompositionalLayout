//
//  CollectionViewHeaderReusableView.swift
//  MultiSectionCompositionalLayout
//
//  Created by V K on 22.01.2023.
//

import UIKit

final class CollectionViewHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var cellTitleLabel: UILabel!
  
    func setup(_ title: String) {
        cellTitleLabel.text = title
    }
}
