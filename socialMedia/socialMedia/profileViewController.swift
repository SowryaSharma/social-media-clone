//
//  profileViewController.swift
//  socialMedia
//
//  Created by Cumulations Technologies on 09/03/22.
//

import UIKit

class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


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
