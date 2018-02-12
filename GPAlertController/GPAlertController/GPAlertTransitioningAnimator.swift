//
//  GPAlertTransitioningAnimator.swift
//  GPAlertController
//
//  Created by Gabriele Pregadio on 2/10/18.
//  Copyright © 2018 Gabriele Pregadio. All rights reserved.
//

import UIKit

class GPAlertTransitioningAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let transitionDuration = GPAlertOptions.defaultPresentationAnimationDuration
    static let `default` = GPAlertTransitioningAnimator()
    private override init() { super.init() }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else { return }
        let containerView = transitionContext.containerView
        toView.alpha = 0
        toView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        containerView.addSubview(toView)
        UIView.animate(withDuration: transitionDuration, animations: {
            toView.alpha = 1
            toView.transform = .identity
        }, completion: { completed in
            transitionContext.completeTransition(completed)
        })
    }
    
}
