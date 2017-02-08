//
//  StoryViewController.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 2/3/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    // MARK: View
    
    var storyView = StoryView()
    let ourStory = Story()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = storyView
        setupViewOnLoad()
    }
    
    /// Setup View upon loading ViewController (e.g. add targets to buttons, update labels with data, etc.)
    func setupViewOnLoad() {
        storyView.collection.dataSource = self
        storyView.collection.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyView.collection.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        storyView.bigBang()
    }
}

extension StoryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as! StoryCollectionCell).locationText = ourStory.boldedString(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as! StoryCollectionCell
        cell.layoutIfNeeded()
        cell.locationText = ourStory.boldedString(index: indexPath.row)
        
        cell.videoContainer.isHidden = (indexPath.row == 0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        storyView.bigBang()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let maxXOffset = scrollView.contentSize.width
        let currentXOffset = scrollView.contentOffset.x + Constants.Metrics.screenWidth
        let progress = currentXOffset / maxXOffset
        
        if progress < 0 || progress > 1.0 {
            return
        }
        
        storyView.pageProgress.update(progress: progress)
    }
}

struct Story {
    
    private let texts = ["Welcome to the CRAZY part of the app.\n\nRULES:\n1. Don't skip ahead.\n2. Don't watch the video until you get to the location.",
                "To start, you need to go where it all really started: The Yellow Door House.",
                "Now, walk around the corner to your old house’s porch.",
                "Head over to the bus stop by the Wilk roundabout.",
                "Remember when we biked the Provo River Trail to the park by the lake? Go there."]
    
    private let boldedTexts = [["CRAZY", "RULES", "skip ahead", "location"],
                    ["The Yellow Door House."],
                    ["your old house’s porch."],
                    ["Wilk roundabout."],
                    ["there."]]
    
    func boldedString(index: Int) -> NSMutableAttributedString {
        let text = texts[index]
        let boldedText = boldedTexts[index]
        
        let nonBoldFontAttribute = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)]
        let attrString = NSMutableAttributedString(string: text, attributes: nonBoldFontAttribute)
        
        for bolded in boldedText {
            let boldFontAttribute = [NSFontAttributeName:UIFont(name: "Avenir-Heavy", size: 20)]
            attrString.addAttributes(boldFontAttribute, range: (text as NSString).range(of: bolded as String))
        }
        
        return attrString
    }
    
    let videoFiles = ["",""]
}




