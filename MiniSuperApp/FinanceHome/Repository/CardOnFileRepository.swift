import Foundation

protocol CardOnFileRepository {
    var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]> { get }
}

final class CardOnFileRepositoryImp: CardOnFileRepository {
    
    var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]>  { paymentMethodsSubject }
    
    private let paymentMethodsSubject = CurrentValuePublisher<[PaymentMethod]>([
        PaymentMethod(id: "0", name: "우리은행", digits: "1234", color: "#f19a38ff", isPrimary: false),
        PaymentMethod(id: "1", name: "신한은행", digits: "4321", color: "#3478f6ff", isPrimary: false),
        PaymentMethod(id: "2", name: "현대은행", digits: "0192", color: "#78c5f5ff", isPrimary: false),
        PaymentMethod(id: "3", name: "국민은행", digits: "6831", color: "#65c466ff", isPrimary: false),
        PaymentMethod(id: "4", name: "카카오뱅크", digits: "8932", color: "#ffcc00ff", isPrimary: false),
        PaymentMethod(id: "4", name: "카카오뱅크", digits: "8932", color: "#ffcc00ff", isPrimary: false),
        PaymentMethod(id: "4", name: "카카오뱅크", digits: "8932", color: "#ffcc00ff", isPrimary: false),
        PaymentMethod(id: "4", name: "카카오뱅크", digits: "8932", color: "#ffcc00ff", isPrimary: false),
        PaymentMethod(id: "4", name: "카카오뱅크", digits: "8932", color: "#ffcc00ff", isPrimary: false),
    ])
}
