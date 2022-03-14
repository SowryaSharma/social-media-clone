//
//  homeViewController.swift
//  socialMedia
//
//  Created by Cumulations Technologies on 09/03/22.
//

import UIKit

class homeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var notifications: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var home: UIButton!
    @IBOutlet weak var browse: UIButton!
    @IBOutlet weak var profile: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        let nib = UINib(nibName: "homeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "homeTableViewCell")

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
    @IBAction func searchPressed(_sender:Any){
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        navigationArray.remove(at: navigationArray.count - 1) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray
        let vc = storyboard?.instantiateViewController(identifier: "search") as! searchViewController
        vc.title = "browse"
        navigationController.pushViewController(vc, animated: false)     }
    @IBAction func notificationPressed(_sender:Any){
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        navigationArray.remove(at: navigationArray.count - 1) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray
        let vc = storyboard?.instantiateViewController(identifier: "notification") as! notificationViewController
        vc.title = "notifications"
        navigationController.pushViewController(vc, animated: false)
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
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
}
