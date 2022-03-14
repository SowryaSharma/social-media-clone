//
//  searchViewController.swift
//  socialMedia
//
//  Created by Cumulations Technologies on 10/03/22.
//

import UIKit

class searchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCollectionViewCell", for: indexPath) as! searchCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate=self
        collectionView.dataSource=self
        let nib = UINib(nibName: "searchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "searchCollectionViewCell")
        // Do any additional setup after loading the view.
    }
    @IBAction func homePressed(_ sender: Any) {
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        navigationArray.remove(at: navigationArray.count - 1) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray
        let vc = storyboard?.instantiateViewController(identifier: "home") as! homeViewController
        vc.title = "Home"
        navigationController.pushViewController(vc, animated: false)
    }
    @IBAction func searchPressed(_sender:Any){
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        navigationArray.remove(at: navigationArray.count - 1) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray
        let vc = storyboard?.instantiateViewController(identifier: "search") as! searchViewController
        vc.title = "browse"
        navigationController.pushViewController(vc, animated: false)
    }
    @IBAction func notificationPressed(_sender:Any){
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        navigationArray.remove(at: navigationArray.count - 1) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray
        let vc = storyboard?.instantiateViewController(identifier: "notification") as! notificationViewController
        vc.title = "notifications"
        navigationController.pushViewController(vc, animated: false)
    }
    @IBAction func profilePressed(_ sender: Any) {
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        navigationArray.remove(at: navigationArray.count - 1) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray
        let vc = storyboard?.instantiateViewController(identifier: "profile") as! profileViewController
        vc.title = "profile"
        navigationController.pushViewController(vc, animated: false)
    }
}
