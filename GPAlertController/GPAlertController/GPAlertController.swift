//
//  GPAlertController.swift
//  GPAlertController
//
//  Created by Gabriele Pregadio on 2/10/18.
//  Copyright © 2018 Gabriele Pregadio. All rights reserved.
//

import UIKit

open class GPAlertController: UIViewController {
    
    // MARK: Variables
    private var alertView: GPAlertView?
    private lazy var firstAction: GPAlertAction = { [unowned self] in
        // TODO: Use title defined by user in constants
        return GPAlertAction(title: "") { _ in
            self.dismiss(animated: true)
        }
    }()
    private var secondAction: GPAlertAction?
    // TODO: Style
    var alertTitle: String?
    var alertDetail: String?
    private var isFirstActionCustom = false
    override open var modalPresentationStyle: UIModalPresentationStyle {
        get { return .overCurrentContext }
        set {  }
    }
    open override var modalTransitionStyle: UIModalTransitionStyle {
        get { return .crossDissolve }
        set {  }
    }
    
    // MARK: Init
    // TODO: Style in init
    convenience init(title: String?, message: String?) {
        self.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        alertTitle = title
    }
    
}
