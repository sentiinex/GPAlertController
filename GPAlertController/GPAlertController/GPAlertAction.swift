//
//  GPAlertAction.swift
//  GPAlertController
//
//  Created by Gabriele Pregadio on 2/10/18.
//  Copyright © 2018 Gabriele Pregadio. All rights reserved.
//

import Foundation

public typealias GPAlertActionHandler = ((GPAlertAction) -> Void)
open class GPAlertAction: NSObject {
    open var title: String?
    open var handler: GPAlertActionHandler?
    public init(title: String? = GPAlertOptions.defaultButtonText, handler: GPAlertActionHandler? = nil) {
        self.title = title
        self.handler = handler
    }
}
