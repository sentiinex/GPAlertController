//
//  GPAlertView.swift
//  GPAlertController
//
//  Created by Gabriele Pregadio on 2/10/18.
//  Copyright © 2018 Gabriele Pregadio. All rights reserved.
//

import UIKit

internal protocol GPAlertViewDelegate: class {
    func gpAlertViewDidTapFirstButton(_ alertView: GPAlertView)
    func gpAlertViewDidTapSecondButton(_ alertView: GPAlertView)
}

internal class GPAlertView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var topSeparatorView: UIView!
    @IBOutlet weak var buttonsSeparatorView: UIView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    weak var delegate: GPAlertViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 270).isActive = true // TODO: Think of a better way
    }
    
    // TODO: Style
    func configure(title: String?, message: String?, firstButtonText: String?, secondButtonText: String?) {
        if title == nil {
            titleLabel.isHidden = true
        } else {
            titleLabel.text = title
        }
        if message == nil {
            messageLabel.isHidden = true
        } else {
            messageLabel.text = message
        }
        firstButton.setTitle(firstButtonText, for: .normal)
        if secondButtonText == nil {
            buttonsSeparatorView.isHidden = true
            secondButton.isHidden = true
        } else {
            secondButton.setTitle(secondButtonText, for: .normal)
        }
        sizeToFit()
    }
    
    @IBAction func tapFirstButton(_ sender: Any) {
        delegate?.gpAlertViewDidTapFirstButton(self)
    }
    
    @IBAction func tapSecondButton(_ sender: Any) {
        delegate?.gpAlertViewDidTapSecondButton(self)
    }
    
}
