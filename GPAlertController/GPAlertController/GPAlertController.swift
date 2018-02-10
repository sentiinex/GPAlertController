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
    public convenience init(title: String?, message: String?) {
        self.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        alertTitle = title
    }
    
    // MARK: UIViewController
    override open func viewDidLoad() {
        super.viewDidLoad()
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        view.isOpaque = false
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareView()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        alertView?.center = view.center
    }
    
    // MARK: Instance methods
    private func prepareView() {
        let nib = UINib(nibName: String(describing: GPAlertView.self), bundle: Bundle(for: GPAlertView.self))
        guard let alertView = nib.instantiate(withOwner: self).first as? GPAlertView else { return } // TODO: Handle error
        alertView.delegate = self
        alertView.configure(title: alertTitle, message: alertDetail, firstButtonText: firstAction.title, secondButtonText: secondAction?.title)
        self.alertView = alertView
        view.addSubview(alertView)
        alertView.center = view.center
    }
    
    func addAction(_ action: GPAlertAction) {
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
