import Foundation

struct PricesUIModel {
    var chat: PriceUIModel?
    var video: PriceUIModel?
    var home: PriceUIModel?
    var hospital: PriceUIModel?
    
    init(chat: PriceUIModel? = nil,
         video: PriceUIModel? = nil,
         home: PriceUIModel? = nil,
         hospital: PriceUIModel? = nil) {
        self.chat = chat
        self.video = video
        self.home = home
        self.hospital = hospital
    }
    
    init(networkModel: User) {
        self = ConverterNetworkModel.getPrices(networkModel: networkModel)
    }
    
    static let example: PricesUIModel = PricesUIModel(chat: PriceUIModel(type: .chat, price: 600),
                                                      video: PriceUIModel(type: .video, price: 800),
                                                      home: PriceUIModel(type: .home, price: 2500),
                                                      hospital: PriceUIModel(type: .hospital, price: 1500))
}
