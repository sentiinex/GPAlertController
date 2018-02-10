//
//  GPAlertAction.swift
//  GPAlertController
//
//  Created by Gabriele Pregadio on 2/10/18.
//  Copyright © 2018 Gabriele Pregadio. All rights reserved.
//

import Foundation

typealias GPAlertActionHandler = ((GPAlertAction) -> Void)
open class GPAlertAction: NSObject {
    var title: String?
    var handler: GPAlertActionHandler?
    init(title: String?, handler: GPAlertActionHandler? = nil) {
        self.title = title
        self.handler = handler
    }
}
