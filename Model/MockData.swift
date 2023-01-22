//
//  MockData.swift
//  MultiSectionCompositionalLayout
//
//  Created by V K on 22.01.2023.
//

import Foundation

struct MockData {
    static let shared = MockData()
    
    private let stories: ListSection = {
        .stories([.init(title: "", image: "profile-1"),
                  .init(title: "", image: "profile-2"),
                  .init(title: "", image: "profile-3"),
                  .init(title: "", image: "profile-4"),
                  .init(title: "", image: "profile-5"),
                  .init(title: "", image: "profile-6"),
                  .init(title: "", image: "profile-7"),
                  .init(title: "", image: "profile-8")])
    }()
    
    private let popular: ListSection = {
        .popular([.init(title: "Foundation", image: "popular-1"),
                  .init(title: "The Expanse", image: "popular-2"),
                  .init(title: "Altered Carbon", image: "popular-3"),
                  .init(title: "Firefly", image: "popular-4"),
                  .init(title: "Star Track", image: "popular-5")])
    }()
    
    private let comingSoon: ListSection = {
        .comingSoon([.init(title: "The Three-Body Problem", image: "soon-1"),
                     .init(title: "Fallout", image: "soon-2"),
                     .init(title: "Alien", image: "soon-3"),
                     .init(title: "The Ark", image: "soon-4"),
                     .init(title: "Hello Tomorrow!", image: "soon-5")])
    }()
    
    var pageData: [ListSection] {
        [stories, popular, comingSoon]
    }
}
