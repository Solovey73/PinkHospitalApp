import Combine
import Foundation

actor DoctorService {
    nonisolated private let networkClient: NetworkClient
    nonisolated let answer: CurrentValueSubject<Answer?, Never>
    
    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
        self.answer = CurrentValueSubject(nil)
    }
    
    nonisolated func fetchDoctors() {
        Task { await getDoctors() }
    }
    
    private func getDoctors() async {
        do {
            let model: Answer = try await networkClient.request(endPoint: .main)
            self.answer.send(model)
        } catch let error {
            print("Error getting doctors: \(error.localizedDescription)")
            self.answer.send(nil)
        }
    }
}
