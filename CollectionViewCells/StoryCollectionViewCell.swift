//
//  StoryCollectionViewCell.swift
//  MultiSectionCompositionalLayout
//
//  Created by V K on 21.01.2023.
//

import UIKit

final class StoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellImageView.layoutIfNeeded()
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
    }
}
