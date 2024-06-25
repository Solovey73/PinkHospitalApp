import Combine
import Foundation

class MainViewModel: ObservableObject {
    @Published private(set) var isCompleted: Bool
    @Published var searchText: String = ""
    @Published var sorted: DoctorSort = .price
    
    private var allmodels: [DoctorShotUIModel]
    private let doctorService: DoctorService
    private var cancellables = Set<AnyCancellable>()
    private var users = [User]()
    
    var filterModels: [DoctorShotUIModel] {
        guard !searchText.isEmpty else {
            return allmodels
        }
        return allmodels.filter {
           return $0.lastName.lowercased().contains(searchText.lowercased()) || $0.firstName.lowercased().contains(searchText.lowercased())
        }
    }
    
    var sortedModels: [DoctorShotUIModel] {
        switch sorted {
        case .price:
            return filterModels.sorted { $0.minPrice > $1.minPrice }
        case .experience:
            return filterModels.sorted { $0.experience > $1.experience }
        case .rating:
            return filterModels.sorted { $0.rating > $1.rating }
        }
    }
    
    init(allmodels: [DoctorShotUIModel] = [],
         isCompleted: Bool = false,
         doctorService: DoctorService ) {
        self.allmodels = allmodels
        self.isCompleted = isCompleted
        self.doctorService = doctorService
        doctorService.fetchDoctors()
        bindingOn()
    }
    
    func getUser(id: String) -> User {
        users.first { $0.id == id }!
    }
    
    private func bindingOn() {
        doctorService.answer
            .receive(on: DispatchQueue.main)
            .sink { [weak self] model in
                guard let model else { return }
                self?.getToAllModels(model)
            }.store(in: &cancellables)
    }
    
    private func getToAllModels(_ model: Answer) {
        users = ConverterNetworkModel.getUser(from: model)
        allmodels = users.compactMap { DoctorShotUIModel (networkModel: $0)}
        isCompleted = true
    }
    
    static let prewiev = MainViewModel(doctorService: DoctorService())
    
}

