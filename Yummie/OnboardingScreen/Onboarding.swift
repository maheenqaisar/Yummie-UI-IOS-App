//
//  Onboarding.swift
//  Yummie
//
//  Created by Maheen on 14/02/2023.
//

import UIKit

class Onboarding: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 { nextBtn.setTitle("Get Started", for: .normal) }
            else { nextBtn.setTitle("Next", for: .normal) }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
            OnboardingSlide(title: "Burger Is Always Better.", description: "If we shake out all of the crumbs from all of the keyboards in the world, we can end world hunger.", image: #imageLiteral(resourceName: "Deconstructed-food")),
            OnboardingSlide(title: "Family Dinner", description: "Dinner is better when we eat together. Families that eat together stay together.", image: #imageLiteral(resourceName: "Eatingtogether")),
            OnboardingSlide(title: "Life Is Short", description: "There is no sincerer love than the love of food. A recipe has no soul. You as the cook must bring soul to the recipe.", image: #imageLiteral(resourceName: "Eatinghealthyfood"))
        ]
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)  {
            super.viewWillTransition(to: size, with: coordinator)
            collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension Onboarding: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
       }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        let indexPath = IndexPath(item: currentPage, section: 0)
         collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
