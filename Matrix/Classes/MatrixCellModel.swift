//
//  MatrixCellModel.swift
//  Matrix
//
//  Created by Luan Sobreira Eustáquio de Oliveira on 11/09/19.
//

import Foundation
import UIKit

public enum MatrixPositionCell {
    case top
    case bottom
    case leading
    case trailling
    case leadingTop
    case leadingBottom
    case traillingTop
    case traillingBottom
    case inner
}

public struct MatrixCellModel {
    
    public var position: MatrixPositionCell = .inner
    public var hasInnerBorder: Bool = true
    public var hasOuterBorder: Bool = true
    public var borderColor: UIColor = UIColor.black
    public var borderSize: CGFloat = 10.0
    
}
