//
//  ViewController.swift
//  socialMedia
//
//  Created by Cumulations Technologies on 09/03/22.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var forgotPassword: UILabel!
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var email: UITextField!
    let obj = databaseManagement()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Log in"
        obj.insert(email: "email", password: "password")

    }

    @IBAction func loginPressed(_ sender: Any) {
        guard let emailText = email.text else{
            return
        }
        guard let passwordText = password.text else{
            return
        }
        let pss  = self.obj.read(emailReceived:emailText)
        if(pss == nil){
            self.forgotPassword.text = "email not found"
        }
        else{

            if(pss==passwordText){
            guard let navigationController = self.navigationController else { return }
            var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
            navigationArray.remove(at: navigationArray.count - 1) // To remove previous UIViewController
            self.navigationController?.viewControllers = navigationArray
            let vc = storyboard?.instantiateViewController(identifier: "home") as! homeViewController
            vc.title = "home"
                dic.removeAll()
            navigationController.pushViewController(vc, animated: true)
        }
        else{
            self.forgotPassword.text = "incorrect password"
        }
        }
    }
    
}

class databaseManagement{
    
    init()
    {
        db = openDatabase()
        createTable()
    }

    let dbPath: String = "detail.sqlite"
    var db:OpaquePointer?

    func openDatabase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS person(email TEXT PRIMARY KEY,password TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("person table created.")
            } else {
                print("person table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insert(email:String, password:String)
    {
        let insertStatementString = "INSERT INTO person (email,password) VALUES (?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func read(emailReceived:String)->String?{
        let queryStatementString = "SELECT password FROM person WHERE email=\(emailReceived);"
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let pass = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
//                let password = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                print("\(pass)")
                return pass
            }
        } else {
            return nil
        }
        sqlite3_finalize(queryStatement)
        print(dic)
        return nil

    }
}

var dic:[String:String] = [:]
