//
//  ViewController.swift
//  MultiSectionCompositionalLayout
//
//  Created by V K on 21.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .stories:
                return self.createLayoutHelper(groupWidthDimension: .absolute(70), groupHeightDimension: .absolute(70), sectionScrollBehavior: .continuous)
            case .popular:
                return self.createLayoutHelper(groupWidthDimension: .fractionalWidth(0.85), groupHeightDimension: .fractionalHeight(0.6), sectionScrollBehavior: .groupPagingCentered)
            case .comingSoon:
                return self.createLayoutHelper(groupWidthDimension: .absolute(180), groupHeightDimension: .absolute(100), sectionScrollBehavior: .continuousGroupLeadingBoundary)
            }
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    private func createLayoutHelper(groupWidthDimension: NSCollectionLayoutDimension, groupHeightDimension: NSCollectionLayoutDimension, sectionScrollBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) -> NSCollectionLayoutSection {
        //item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        //group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: groupWidthDimension, heightDimension: groupHeightDimension), subitems: [item])
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = sectionScrollBehavior
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
        
        return section
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .stories(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        case .popular(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortraitCollectionViewCell", for: indexPath) as! PortraitCollectionViewCell
            cell.setup(items[indexPath.row])
            cell.layer.cornerRadius = 15
            return cell
        case .comingSoon(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LandscapeCollectionViewCell", for: indexPath) as! LandscapeCollectionViewCell
            cell.setup(items[indexPath.row])
            cell.layer.cornerRadius = 10
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewHeaderReusableView", for: indexPath) as! CollectionViewHeaderReusableView
            header.setup(sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}




