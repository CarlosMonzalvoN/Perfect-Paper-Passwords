//
//  KeyCell.swift
//  Perfect Paper Passwords
//
//  Created by Pedro Carlos Monzalvo Navarro on 07/02/20.
//  Copyright © 2020 Pedro Carlos Monzalvo Navarro. All rights reserved.
//

import UIKit

class KeyCell: UICollectionViewCell {
    
    @IBOutlet private weak var valueLabel: UILabel?

    func update(withValue value: String) {
        valueLabel?.text = value
        valueLabel?.sizeToFit()
        clipsToBounds = false
    }
    
}
