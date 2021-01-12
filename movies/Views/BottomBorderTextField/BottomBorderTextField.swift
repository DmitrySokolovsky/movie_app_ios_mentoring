//
//  BottomBorderTextField.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 10.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class UnderlinedTextField: UITextField {
    lazy var bottomBorder: CALayer = {
            let border = CALayer();
            border.borderColor = UIColor.red.cgColor;
            border.borderWidth = 1;
            return border
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

        borderStyle = .none;
        layer.addSublayer(bottomBorder);
    }
}
