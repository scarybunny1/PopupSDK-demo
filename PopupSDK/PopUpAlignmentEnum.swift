//
//  PopUpAlignmentEnum.swift
//  PopupSDK
//
//  Created by Ayush Bhatt on 24/07/23.
//

import Foundation

/// Enum representing different alignments for a pop-up on the screen.
public enum PopUpAlignment {
    /// Aligns the pop-up on the screen with a vertical offset.
    /// - Parameter offset: A parameter that represents the vertical offset of the pop-up from the top of the container.
    /// A positive value will move the pop-up downward, while a negative value will move it upward.
    case top(offset: Double)
    
    /// Vertically centers the pop-up on the screen.
    case center
    
    /// Aligns the pop-up on the screen with a vertical offset.
    /// - Parameter offset: A parameter that represents the vertical offset of the pop-up from the bottom of the container.
    /// A positive value will move the pop-up upward, while a negative value will move it downward.
    case bottom(offset: Double)
}
