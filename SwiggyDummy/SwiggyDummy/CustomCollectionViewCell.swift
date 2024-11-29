//
//  CustomCollectionViewCell.swift
//  SwiggyDummy
//
//  Created by Utkarsh Raj on 29/11/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let customImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.clipsToBounds = true
        return iv
    }()
    
    public func configure(with image: UIImage) {
        self.customImageView.image = image
        self.setupUI()
    }
    
    private func setupUI() {
        style()
        layout()
    }
    
    private func style() {
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customImageView.backgroundColor = .white
        customImageView.layer.cornerRadius = 8.0
        customImageView.tintColor = .red
        
    
    }
    private func layout() {
        self.addSubview(customImageView)
        
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            customImageView.topAnchor.constraint(equalTo: self.topAnchor),
            customImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.customImageView.image = nil
        
    }
    
    
}
