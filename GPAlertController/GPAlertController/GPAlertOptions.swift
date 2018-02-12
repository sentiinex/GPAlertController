//
//  GPAlertOptions.swift
//  GPAlertController
//
//  Created by Gabriele Pregadio on 2/10/18.
//  Copyright © 2018 Gabriele Pregadio. All rights reserved.
//

import UIKit

public struct GPAlertOptions {
    private init() { }
    internal static let defaultFont = UIFont.systemFont(ofSize: 15)
    public static var defaultButtonText = "OK"
    public static var defaultPresentationAnimationDuration: TimeInterval = 0.18
}
