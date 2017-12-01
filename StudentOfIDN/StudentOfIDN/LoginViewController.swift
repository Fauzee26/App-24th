//
//  LoginViewController.swift
//  StudentOfIDN
//
//  Created by Muhammad Hilmy Fauzi on 16/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var etusername: UITextField!
    @IBOutlet weak var etpassword: UITextField!
    
    var userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userDefaults = UserDefaults.standard
    }
    @IBAction func btnlogin(_ sender: Any) {
        let nilaiUser = etusername.text!
        let nilaiPass = etpassword.text!
        
        if((nilaiUser.isEmpty) || (nilaiPass.isEmpty)) {
            let alertWarning = UIAlertController(title: "Warning", message: "This Is Required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            let params = ["email" : nilaiUser, "password" : nilaiPass]
            let url = "http://localhost/SantriIDN/index.php/api/login"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {
                (responseServer) in
                
                print(responseServer.result.isSuccess)
                
                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    
                    print(json)
                   let data = json["data"].dictionaryValue
                    let nUsername = data["username"]?.stringValue
                    let nEmail = data["email"]?.stringValue
                    
                    //menyimpan data ke sesi lokal
                    self.userDefaults.setValue(nUsername, forKey: "USERNAME")
                    self.userDefaults.setValue(nEmail, forKey: "PASSWORD")
                    //untuk sinkronisasi data
                    self.userDefaults.synchronize()
                    
                    //pindah ke layout welcome
                    let story = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                    let id = story.instantiateViewController(withIdentifier: "welcome")
                    self.show(id, sender: self)
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
