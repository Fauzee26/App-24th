//
//  ListSiswaTableViewController.swift
//  StudentOfIDN
//
//  Created by Muhammad Hilmy Fauzi on 16/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListSiswaTableViewController: UITableViewController {
    var namaSelected:String?
    var emailSelected:String?
    var kelasSelected:String?
    var alamatSelected:String?
    var telpSelected:String?
    var kelaminSelected:String?
    
    var nampungId : String? = nil
    var arraySiswa = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        print("id +" + nampungId!)
        
        let params = ["id_kelas" : nampungId!]
        let url = "http://localhost/SantriIDN/index.php/api/getSiswaByKelas"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
            //check response
            if response.result.isSuccess {
                let json = JSON(response.result.value as Any)
                print(json)
                self.arraySiswa = json["List Siswa"].arrayObject as! [[String : String]]
                
                if(self.arraySiswa.count > 0){
                    self.tableView.reloadData()
                }
            }else{
                print("Error Server")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraySiswa.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSiswa", for: indexPath) as! ListSiswaTableViewCell

        var serverid = arraySiswa[indexPath.row]
        
        var id = serverid["id_siswa"]
        let nama = serverid["Nama"]
        let email = serverid["Email"]
        let kelas = serverid["Kelas"]
        
        //pindahkan ke cell
        cell.labelNama.text = nama
        cell.labelEmail.text = email
        cell.labelKelaS.text = kelas
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arraySiswa[indexPath.row]
        
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = task["Nama"] as? String
        emailSelected = task["Email"] as? String
        kelasSelected = task["Kelas"] as? String
        alamatSelected = task["Alamat"] as? String
        telpSelected = task["No Telp"] as? String
        kelaminSelected = task["Jenis Kelamin"] as? String
        
        performSegue(withIdentifier: "segue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "segue"{

            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                let value = arraySiswa[indexPath.row]
                controller.passNama = value["Nama"] as? String
                controller.passEmail = value["Email"] as? String
                controller.passKelas = value["Kelas"] as? String
                controller.passAlamat = value["Alamat"] as? String
                controller.passTelp = value["No Telp"] as? String
                controller.passKelamin = value["Jenis Kelamin"] as? String
            }
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
