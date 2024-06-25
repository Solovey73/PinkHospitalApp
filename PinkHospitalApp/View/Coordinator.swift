import Combine
import SwiftUI

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    private var doctorService: DoctorService
    private var viewModel: MainViewModel
    private var currentUser: User?
    
    init(doctorService: DoctorService = DoctorService()) {
        self.doctorService = doctorService
        self.viewModel = MainViewModel(doctorService: doctorService)
    }
    
    func push(_ page: Page, user: User) {
        self.currentUser = user
        path.append(page)
    }
    
    func pop() {
        if path.count >= 1 {
            path.removeLast()
        }
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .main:
            mainView()
        case .doctor:
            doctorScreenView()
        case .price:
            priceScreen()
        }
    }
    
    @ViewBuilder
    func mainView() -> some View {
        MainView(viewModel: viewModel)
    }
    
    @ViewBuilder
    func doctorScreenView() -> some View {
        let doctorUIModel = DoctorUIModel(networkModel: currentUser!)
        DoctorScreenView(model: doctorUIModel, viewModel: viewModel)
    }
    
    @ViewBuilder
    func priceScreen() -> some View {
        let pricesModel = PricesUIModel(networkModel: currentUser!)
        PriceScreenView(model: pricesModel)
    }
}

enum Page: String, Identifiable {
    case main, doctor, price
    var id: String {
        self.rawValue
    }
}

