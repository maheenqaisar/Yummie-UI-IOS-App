//
//  HomeScreen.swift
//  Yummie
//
//  Created by Maheen on 14/02/2023.
//

import UIKit

class HomeScreen: UIViewController {

    @IBOutlet weak var CategoryCollection: UICollectionView!
    @IBOutlet weak var PopularCollection: UICollectionView!
    @IBOutlet weak var SpecialCollection: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "ID-1", name: "Biryani-1", image: "https://untoldrecipesbynosheen.com/wp-content/uploads/2021/03/best-mutton-biryani-still-new.jpg"),
        .init(id: "ID-2", name: "Biryani-2", image: "https://untoldrecipesbynosheen.com/wp-content/uploads/2021/03/best-mutton-biryani-still-new.jpg"),
        .init(id: "ID-3", name: "Biryani-3", image: "https://untoldrecipesbynosheen.com/wp-content/uploads/2021/03/best-mutton-biryani-still-new.jpg"),
        .init(id: "ID-4", name: "Biryani-4", image: "https://untoldrecipesbynosheen.com/wp-content/uploads/2021/03/best-mutton-biryani-still-new.jpg"),
        .init(id: "ID-5", name: "Biryani-5", image:"https://untoldrecipesbynosheen.com/wp-content/uploads/2021/03/best-mutton-biryani-still-new.jpg"),
        .init(id: "ID-6", name: "Biryani-6", image:"https://untoldrecipesbynosheen.com/wp-content/uploads/2021/03/best-mutton-biryani-still-new.jpg"),
        .init(id: "ID-7", name: "Biryani-7", image:"https://untoldrecipesbynosheen.com/wp-content/uploads/2021/03/best-mutton-biryani-still-new.jpg"),
        .init(id: "ID-8", name: "Biryani-8", image:"https://untoldrecipesbynosheen.com/wp-content/uploads/2021/03/best-mutton-biryani-still-new.jpg")
    ]
    
    var populars: [Dish] = [
        .init(id: "ID-1", name: "Pizza", description: "This is the best I have ever tasted", image: "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=800&height=800", calories: 34),
        .init(id: "ID-2", name: "Pasta", description: "This is the best I have ever tasted", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2021/02/05/Baked-Feta-Pasta-4_s4x3.jpg.rend.hgtvcom.616.493.suffix/1615916524567.jpeg", calories: 314),
        .init(id: "ID-3", name: "Donut", description: "This is the best I have ever tasted", image: "https://www.foodbusinessnews.net/ext/resources/2020/2/donut_lead.jpg?height=667&t=1581611120&width=1080", calories: 104),
    ]
    
    var special: [Dish] = [
        .init(id: "ID-1", name: "Burger", description: "This is the best I have ever tasted", image: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/black_and_blue_burger_95881_16x9.jpg", calories: 34),
        .init(id: "ID-2", name: "Butter Chicken", description: "This is the best I have ever tasted", image: "https://www.cookingclassy.com/wp-content/uploads/2021/01/butter-chicken-4.jpg", calories: 314),
        .init(id: "ID-3", name: "Suchi", description: "This is the best I have ever tasted", image: "https://robertocavada.com/wp-content/uploads/2022/06/1466167875.3119-770x540.jpg", calories: 104),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yummie"
        RegisterCells()
    }

    private func RegisterCells() {
        CategoryCollection.register(UINib(nibName: CategoryViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryViewCell.identifier)
        PopularCollection.register(UINib(nibName: PopularViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularViewCell.identifier)
        SpecialCollection.register(UINib(nibName: SpecialViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SpecialViewCell.identifier)
    }
    
    @IBAction func cartbtnclicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController( withIdentifier: "ListOrdersScreen") as! ListOrdersScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case CategoryCollection:
            return categories.count
        case PopularCollection:
            return populars.count
        case SpecialCollection:
            return special.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case CategoryCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.identifier, for: indexPath) as! CategoryViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case PopularCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularViewCell.identifier, for: indexPath) as! PopularViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case SpecialCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialViewCell.identifier, for: indexPath) as! SpecialViewCell
            cell.setup(dish: special[indexPath.row])
            return cell
        default:
           return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == CategoryCollection {
            let controller = ListDishesScreen.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailScreen.instantiate()
            controller.dish = collectionView == PopularCollection ? populars[indexPath.row]:special[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
