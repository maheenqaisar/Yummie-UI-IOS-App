//
//  DishDetailScreen.swift
//  Yummie
//
//  Created by Maheen on 15/02/2023.
//

import UIKit
import Kingfisher

class DishDetailScreen: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopulateView()
    }
    
    private func PopulateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Enjoy 😃", message: "Order has been placed.", preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
          alert.dismiss(animated: true, completion: nil)
        }
    }
}
