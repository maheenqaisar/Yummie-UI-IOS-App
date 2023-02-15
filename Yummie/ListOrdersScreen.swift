//
//  ListOrdersScreen.swift
//  Yummie
//
//  Created by Maheen on 15/02/2023.
//

import UIKit

class ListOrdersScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "ID-1", name: "Maheen Qaisar", dish: .init(id: "ID-1", name: "Donuts", description: "This is the best I have ever tasted", image: "https://img.sndimg.com/food/image/upload/f_auto,c_thumb,q_55,w_744,ar_5:4/v1/img/recipes/46/15/62/Ni77fyX4QnWejcu77UcH_0S9A9895.jpg", calories: 34)),
        .init(id: "ID-2", name: "Maheen Qaisar", dish: .init(id: "ID-2", name: "Shawarma", description: "This is the best I have ever tasted", image: "https://www.licious.in/blog/wp-content/uploads/2020/12/Chicken-Shawarma.jpg", calories: 34)),
        .init(id: "ID-3", name: "Maheen Qaisar", dish: .init(id: "ID-3", name: "Rice and Stew", description: "This is the best I have ever tasted", image: "https://peacockrice.com.gh/wp-content/uploads/2021/08/Imagen-4.jpg", calories: 34)),
        .init(id: "ID-4", name: "Maheen Qaisar", dish: .init(id: "ID-4", name: "Fried Yam", description: "This is the best I have ever tasted", image: "https://myrecipejoint.com/wp-content/uploads/2020/08/file-15523190795961-500x500.jpg", calories: 34)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        RegisterCells()
    }

    private func RegisterCells() {
        tableView.register(UINib(nibName: DishListCell.identifier, bundle: nil), forCellReuseIdentifier: DishListCell.identifier)
    }
}

extension ListOrdersScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListCell.identifier) as! DishListCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailScreen.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            orders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
