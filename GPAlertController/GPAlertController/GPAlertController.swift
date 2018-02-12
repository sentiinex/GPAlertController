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
        return GPAlertAction(title: GPAlertOptions.defaultButtonText) { _ in
            self.dismiss(animated: true)
        }
    }()
    private var secondAction: GPAlertAction?
    var alertTitle: String?
    var alertMessage: String?
    private var isFirstActionCustom = false
    override open var modalPresentationStyle: UIModalPresentationStyle {
        get { return .overCurrentContext }
        set {  }
    }
    open override var modalTransitionStyle: UIModalTransitionStyle {
        get { return .crossDissolve }
        set {  }
    }
    open var titleFont = GPAlertOptions.defaultFont.withSize(24)
    open var titleTextColor = UIColor.white
    open var messageFont = GPAlertOptions.defaultFont.withSize(15)
    open var messageTextColor = UIColor.black
    
    // MARK: Init
    public convenience init(title: String?, message: String?) {
        self.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        alertTitle = title
        alertMessage = message
        transitioningDelegate = self
    }
    
    // MARK: UIViewController
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureAlertView()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        alertView?.center = view.center
    }
    
    // MARK: Instance methods
    private func configureView() {
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) // TODO: Use custom-defined constant
        view.isOpaque = false
    }
    
    private func configureAlertView() {
        let nib = UINib(nibName: String(describing: GPAlertView.self), bundle: Bundle(for: GPAlertView.self))
        guard let alertView = nib.instantiate(withOwner: self).first as? GPAlertView else { return } // TODO: Handle error
        alertView.delegate = self
        alertView.titleLabel.textColor = titleTextColor
        alertView.titleLabel.font = titleFont
        alertView.messageLabel.textColor = messageTextColor
        alertView.messageLabel.font = messageFont
        alertView.configure(title: alertTitle, message: alertMessage, firstButtonText: firstAction.title, secondButtonText: secondAction?.title)
        self.alertView = alertView
        view.addSubview(alertView)
        alertView.center = view.center
    }
    
    open func addAction(_ action: GPAlertAction) {
        if !isFirstActionCustom {
            firstAction = action
            isFirstActionCustom = true
        } else {
            secondAction = action
        }
    }
    
}

// MARK: GPAlertViewDelegate
extension GPAlertController: GPAlertViewDelegate {
    func gpAlertViewDidTapFirstButton(_ alertView: GPAlertView) {
        if let handler = firstAction.handler {
            handler(firstAction)
            dismiss(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    func gpAlertViewDidTapSecondButton(_ alertView: GPAlertView) {
        guard let secondAction = secondAction else {
            dismiss(animated: true)
            return
        }
        if let handler = secondAction.handler {
            handler(secondAction)
            dismiss(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}

// MARK: UIViewControllerTransitioningDelegate
extension GPAlertController: UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return GPAlertTransitioningAnimator.default
    }
}
