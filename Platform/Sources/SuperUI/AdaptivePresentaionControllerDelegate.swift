import UIKit
import Foundation

public protocol AdaptivePresentaionControllerDelegate: AnyObject {
    func presentaionControllerDismiss()
}

public final class AdaptivePresentaionControllerDelegateProxy
: NSObject
, UIAdaptivePresentationControllerDelegate {
    public weak var delegate: AdaptivePresentaionControllerDelegate?
    
    public func presentationControllerDidDismiss(_ presentationConroller: UIPresentationController) {
        delegate?.presentaionControllerDismiss()
    }
}
