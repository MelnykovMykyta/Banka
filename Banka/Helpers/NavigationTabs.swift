//
//  NavigationTabs.swift
//  Banka
//
//  Created by Nikita Melnikov on 18.02.2024.
//

import Foundation
import UIKit

enum NavigationTabs: Int {
    
    case main
    case graphs
    
    var icon: UIImage {
        
        switch self {
        case .main:
            return UIImage(systemName: "house") ?? UIImage()
        case .graphs:
            return UIImage(systemName: "chart.xyaxis.line") ?? UIImage()
        }
    }
    
    var itemTitle: String {
        
        switch self {
        case .main:
            return "Main"
        case .graphs:
            return "Stats"
        }
    }
    
    var itemBar: UITabBarItem {
        
        switch self {
        case .main:
            return UITabBarItem(title: NavigationTabs.main.itemTitle, image: NavigationTabs.main.icon, tag: NavigationTabs.main.rawValue)
        case .graphs:
            return  UITabBarItem(title: NavigationTabs.graphs.itemTitle, image: NavigationTabs.graphs.icon, tag: NavigationTabs.graphs.rawValue)
        }
    }
}
