//
//  PortraitCollectionViewCell.swift
//  MultiSectionCompositionalLayout
//
//  Created by V K on 21.01.2023.
//

import UIKit

final class PortraitCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellTitleLabel.text = item.title
    }
}
