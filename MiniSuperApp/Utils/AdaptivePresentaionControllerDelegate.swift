import UIKit
import Foundation

protocol AdaptivePresentaionControllerDelegate: AnyObject {
    func presentaionControllerDismiss()
}

final class AdaptivePresentaionControllerDelegateProxy
: NSObject
, UIAdaptivePresentationControllerDelegate {
    weak var delegate: AdaptivePresentaionControllerDelegate?
    
    func presentationControllerDidDismiss(_ presentationConroller: UIPresentationController) {
        delegate?.presentaionControllerDismiss()
    }
}
