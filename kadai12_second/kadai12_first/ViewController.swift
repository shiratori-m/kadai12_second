//
//  ViewController.swift
//  kadai12_first
//
//  Created by 白鳥貢 on 2020/08/21.
//  Copyright © 2020 mitsugu.shiratori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var zeinukiTextField: UITextField!
    @IBOutlet private weak var zeiritsuTextField: UITextField!
    @IBOutlet weak var calcResultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Userdefaultsから消費税率を取り出す
        if UserDefaults.standard.bool(forKey: "isSaved") == false {
        }else{
            fetchUserdefault()
        }
    }
    
    @IBAction func calcButton(_ sender: Any) {
        //まず格納
        storeUserdefault()
        
        //入力
        let zeinuki = Int(zeinukiTextField.text ?? "") ?? 0
        let zeiritsu = Int(zeiritsuTextField.text ?? "") ?? 0
        
        //税率の計算
        let zeiritsuDouble = (Double(zeiritsu) / 100) + 1
        //print("zeirisuDouble : ",zeiritsuDouble)
        
        //計算元の型の統一
        let zeinukiDouble = Double(zeinuki)
        //print("zeinukiDouble : ",zeinukiDouble)
        
        //表示する金額
        let calcResult = Int(zeinukiDouble * zeiritsuDouble)
        //print("calcResult : ",calcResult)
        calcResultLabel.text = String(calcResult)
    }
    
    func storeUserdefault(){
        
        let zeiritsu = Int(zeiritsuTextField.text!)
        UserDefaults.standard.set(zeiritsu, forKey: "zeiritsu")
        
        //一度でも格納されたことがあるかの印
        let checkStoredOnce:Bool = true
        UserDefaults.standard.set(checkStoredOnce, forKey: "isSaved")
    }
    
    func fetchUserdefault(){
        let zeiritsuUserdefault = UserDefaults.standard.integer(forKey: "zeiritsu")
        zeiritsuTextField.text = String(zeiritsuUserdefault)
    }
}
