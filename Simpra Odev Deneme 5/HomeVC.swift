//
//  ViewController.swift
//  Simpra Odev Deneme 5
//
//  Created by Hakan Baran on 15.01.2023.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var newsList: [News]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getNewsData()
        
        
    }
    
    private func getNewsData() {
        
        
        APICaller.shared.getTopStories { results in
            switch results {
            case .success(let news):
                self.newsList = news
                //print(self.newsList)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList?.count ?? 0
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let newsResult = newsList?[indexPath.item]
        print(newsResult)
        
        
        
        
        
        cell.nameLabel.text = newsResult?.author ?? ""
        cell.overviewLabel.text = newsResult?.description ?? ""
        
        let imageURL = newsResult?.urlToImage!
        let posterURL = URL(string: imageURL!)
        
        cell.imageView.sd_setImage(with: posterURL)
        
        
        return cell
    }
    
}

extension HomeVC: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        
        /*
         if let post = newsList?[indexPath.item], let photo = post.urlToImage {
             let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
         }
         
         */
        
        return 280
        
    }
    
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        
        if let post = newsList?[indexPath.item] {
            let topPadding = CGFloat(8)
            let bottomPadding = CGFloat(12)
            let captionFont = UIFont.systemFont(ofSize: 15)
            let captionHeight = self.height(for: post.description!, with: captionFont, width: width)
            
            let height = topPadding + captionHeight + topPadding + bottomPadding
            
            return height
        }
        
        return 0.0
        
    }
    
    func height(for text: String, with font: UIFont, width: CGFloat) -> CGFloat
    {
        let nsstring = NSString(string: text)
        let maxHeight = CGFloat(MAXFLOAT)//alabileceği maximumum değer
        let textAttributes = [NSAttributedString.Key.font : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
    
    
}


