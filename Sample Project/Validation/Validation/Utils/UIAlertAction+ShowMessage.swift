import Foundation
import UIKit

extension UIAlertController {
    static func showMessage(_ message: String, in viewController: UIViewController) {
        let alertController = UIAlertController(title: "Result",
                                                message: message,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: nil)
        alertController.addAction(action)
        viewController.present(alertController,
                               animated: true,
                               completion: nil)
    }
}
