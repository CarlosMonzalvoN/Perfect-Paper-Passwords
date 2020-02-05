//
//  ViewController.swift
//  Perfect Paper Passwords
//
//  Created by Pedro Carlos Monzalvo Navarro on 03/02/20.
//  Copyright © 2020 Pedro Carlos Monzalvo Navarro. All rights reserved.
//

import UIKit
import CryptoKit

class ViewController: UIViewController {

    let alphabet = "! # % + 2  3 4 5 6 7 8 9 : = ? @ A B C D E F G H J K L M N P R S T U V W X Y Z a b c d e f g h i j k m n o p q r s t u v w x y z"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let alphabetArray = alphabet.split(separator: " ")
        let key = SymmetricKey(size: .bits256)
        //        let legibleSymmetrickey = key.withUnsafeBytes {
        //            return Data(Array($0)) /// Asi lo usamos para mandarlo al keychain. Si lo queremos ver usamos b64
        //        }
        var pages : [String] = []
        var counter : UInt128 = 0
        
        for index in 0...128 {
            counter = UInt128(index)
            let data = Data(bytes: &counter, count: MemoryLayout.size(ofValue: counter))
            let encryptedContent = try! AES.GCM.seal(data, using: key).combined!
            let intValueAes = encryptedContent.withUnsafeBytes { $0.load(as: UInt128.self) }
            let residuo : Int = Int(intValueAes % 64)
            pages.append(String(alphabetArray[residuo]))
        }
        print(pages)
    }
    
}

