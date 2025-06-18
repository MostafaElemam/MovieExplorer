//
//  UICollectionViewCell.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 17/06/2025.
//

import UIKit

extension UICollectionViewCell {
    //    Defining identifier and Nib
    static var identifier : String { return String(describing: self)}
    static var nib : UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
