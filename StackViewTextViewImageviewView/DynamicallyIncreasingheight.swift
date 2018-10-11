//
//  DynamicallyIncreasingheight.swift
//  StackViewTextViewImageviewView
//
//  Created by Daniyal Yousuf on 10/11/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit

protocol DynamicallyIncreasingheightDelegate:class {
    func didtapAdd(text: String, cell: UITableViewCell)
}

class DynamicallyIncreasingheight: UITableViewCell {

    var delegate: DynamicallyIncreasingheightDelegate?
    
    var textView: String? {
        
        didSet {
            
            guard let data = textView else { return }
            textViewBase.text = data
            
            
        }
        
        
    }
    
    
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var tFMessage: UITextField!
    @IBOutlet weak private var textViewBase: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didTappedAdd(_ sender: UIButton) {
        self.delegate?.didtapAdd(text: tFMessage.text!, cell: self)
    }
}
