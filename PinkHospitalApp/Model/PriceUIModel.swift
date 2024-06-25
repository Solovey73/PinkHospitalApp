import Foundation

struct PriceUIModel {
    let name: String
    let comment: String
    let price: Int
    
    init(type: PriceType, price: Int) {
        self.name = type.name
        self.comment = type.comment
        self.price = price
    }
    
    static let example = PriceUIModel(type:.chat,
                                      price: 600)
}
