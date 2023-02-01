//
//  ViewController.swift
//  IMC
//
//  Created by Pedro Henrique  on 11/05/2022.
//  Copyright © 2022 Pedro Henrique . All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any) {
        let test = tfWeight.text!
        let test1 = test.replacingOccurrences(of:",", with: ".")
        let test2 = tfHeight.text!
        let test3 = test2.replacingOccurrences(of:",", with: ".")
        
        if let weight = Double(test1), let height = Double(test3){
            imc = weight / pow(height,2)
            showResults()
        }
    }
    func showResults(){
        var result: String = ""
        var image: String = ""

        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"

            
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named:image)
        viResult.isHidden = false
        view.endEditing(true)
    
    }
}
