//
//  ViewController.swift
//  StudentOfIDN
//
//  Created by Muhammad Hilmy Fauzi on 16/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblKelas: UILabel!
    @IBOutlet weak var lblAlamat: UILabel!
    @IBOutlet weak var lblTelp: UILabel!
    @IBOutlet weak var lblKelamin: UILabel!
    
    var passNama:String?
    var passEmail:String?
    var passKelas:String?
    var passAlamat:String?
    var passTelp:String?
    var passKelamin:String?
    override func viewDidLoad() {
        
        lblNama.text = "Nama: " + passNama!
        lblEmail.text = "Email: " + passEmail!
        lblKelas.text = "Kelas: " + passKelas!
        lblAlamat.text = "Alamat: " + passAlamat!
        lblTelp.text = "No Telp: " + passTelp!
        lblKelamin.text = "Jenis Kelamin: " + passKelamin!
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

