import SwiftUI

extension Font {
    static func customFontBold(size: CGFloat) -> Font {
        return .custom("IBMPlexSans-Bold", size: size)
    }
    
    static func customFontMedium(size: CGFloat) -> Font {
        return .custom("IBMPlexSans-Medium", size: size)
    }
    
    static func customFontRegular(size: CGFloat) -> Font {
        return .custom("IBMPlexSans-Regular", size: size)
    }
    
    static func customFontSemiBold(size: CGFloat) -> Font {
        return .custom("IBMPlexSans-SemiBold", size: size)
    }
}
