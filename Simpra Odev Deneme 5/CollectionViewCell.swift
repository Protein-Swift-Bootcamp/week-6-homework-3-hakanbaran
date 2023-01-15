//
//  CollectionViewCell.swift
//  Simpra Odev Deneme 5
//
//  Created by Hakan Baran on 15.01.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        
        configureView()
        configurePhotoView()
    }
    
    
    
    private func configurePhotoView(){
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowRadius = 10
    }
    
    private func configureView(){
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    
}
