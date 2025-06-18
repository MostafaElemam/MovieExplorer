//
//  MovieCell.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 17/06/2025.
//

import UIKit
import UIView_Shimmer
import SDWebImage

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    
    var delegate: MovieCellDelegate?
    
    // MARK: - Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 8
        self.layer.cornerRadius = 8
        addShadow()
    }
    func configure(with movie: Movie?) {
        guard let movie else { return }
        let imageFullPath = K.imgStorageURL + movie.posterPath
        nameLabel.text = movie.title
        imgView.contentMode = .scaleAspectFill
        imgView.sd_setImage(with: URL(string: imageFullPath))
        imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        favButton.isSelected = movie.isFavourite
    }
    
    @IBAction func didTapFavButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        delegate?.didTapFavourite(self)
    }

}

protocol MovieCellDelegate {
    func didTapFavourite(_ cell: MovieCell)
}
