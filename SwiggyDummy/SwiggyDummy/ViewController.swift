//
//  ViewController.swift
//  SwiggyDummy
//
//  Created by Utkarsh Raj on 29/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    let imageList = [
        UIImage(systemName: "square.and.arrow.up"),
        UIImage(systemName: "hourglass"),
        UIImage(systemName: "clock.arrow.2.circlepath"),
        UIImage(systemName: "sun.horizon.circle.fill"),
        UIImage(systemName: "brain.filled.head.profile"),
        UIImage(systemName: "eye.trianglebadge.exclamationmark.fill"),
        UIImage(systemName: "stethoscope"),
        UIImage(systemName: "figure.walk.diamond.fill"),
        UIImage(systemName: "sun.dust"),
        UIImage(systemName: "sun.max.fill"),
        UIImage(systemName: "clock.badge.fill"),
        UIImage(systemName: "number"),
        UIImage(systemName: "function"),
        UIImage(systemName: "circle.fill"),
        UIImage(systemName: "eraser.fill"),
        UIImage(systemName: "questionmark.square.fill"),
        UIImage(systemName: "command"),
        UIImage(systemName: "rectangle.fill.on.rectangle.fill"),
        UIImage(systemName: "personalhotspot.circle"),
        UIImage(systemName: "figure.roll"),
        UIImage(systemName: "figure.2"),
        UIImage(systemName: "checkmark.seal.fill"),
        UIImage(systemName: "seal.fill"),
        UIImage(systemName: "hand.raised.square.on.square.fill"),
        UIImage(systemName: "bolt.car.fill"),
        UIImage(systemName: "airplane"),
        UIImage(systemName: "figure.walk.diamond.fill"),
        UIImage(systemName: "arrowshape.backward"),
//        UIImage(systemName: "square.and.arrow.up.fill"),
        
        
    ]
    
    
    lazy private var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10     // Space between rows
        layout.minimumInteritemSpacing = 10 // Space between columns
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        layout()
        style()
    }
    
    private func layout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    private func style() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }


}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: imageList[indexPath.row]!)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVc = ViewController()
        self.navigationController?.pushViewController(newVc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        let h = (height-5)/2
        return CGSize(width: h, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
