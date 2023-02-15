//
//  ListDishesScreen.swift
//  Yummie
//
//  Created by Maheen on 15/02/2023.
//

import UIKit

class ListDishesScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    var dishes: [Dish] = [
        .init(id: "ID-1", name: "Donuts", description: "This is the best I have ever tasted", image: "https://img.sndimg.com/food/image/upload/f_auto,c_thumb,q_55,w_744,ar_5:4/v1/img/recipes/46/15/62/Ni77fyX4QnWejcu77UcH_0S9A9895.jpg", calories: 34),
        .init(id: "ID-2", name: "Butter Chicken", description: "This is the best I have ever tasted", image: "https://www.cookingclassy.com/wp-content/uploads/2021/01/butter-chicken-4.jpg", calories: 34),
        .init(id: "ID-3", name: "Kadhi Rice", description: "This is the best I have ever tasted", image: "https://www.seasonalcravings.com/wp-content/uploads/2021/11/creamy-chicken-curry-and-rice-3-scaled.jpg", calories: 34),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        RegisterCells()
    }
    
    private func RegisterCells() {
        tableView.register(UINib(nibName: DishListCell.identifier, bundle: nil), forCellReuseIdentifier: DishListCell.identifier)
    }

}

extension ListDishesScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListCell.identifier) as! DishListCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailScreen.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
