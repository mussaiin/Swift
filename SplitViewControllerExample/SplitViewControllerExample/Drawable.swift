//
//  Drawable.swift
//  SplitViewControllerExample
//
//  Created by Darkhan on 12.02.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
protocol Drawable{
    func getPath(_ center: CGPoint, _ radius: CGFloat)-> UIBezierPath
}
