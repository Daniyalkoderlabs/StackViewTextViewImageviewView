//
//  CellB.swift
//  StackViewTextViewImageviewView
//
//  Created by Daniyal Yousuf on 10/10/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit

class CellB: UITableViewCell {

    @IBOutlet weak var viewtop: UIView!
    @IBOutlet weak var viewbottom: UIView!
    @IBOutlet weak var baseTextView: UITextView!
    @IBOutlet weak var viewBaseStackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    var setTextViewText: String? {
        
        didSet {
            
            guard let data = setTextViewText else { return }
            baseTextView.text = data
            
            
        }
        
    }
    
}
