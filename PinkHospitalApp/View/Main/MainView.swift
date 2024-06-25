import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if viewModel.isCompleted == true {
            NavigationView {
                VStack(spacing: 24) {
                    FilterView(currentSorted: $viewModel.sorted)
                        .padding(.horizontal)
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(viewModel.sortedModels.indices, id:\.self) { index in
                                DoctorShotView(doctorModel: viewModel.sortedModels[index]) {
                                    print("Выбран \(index)")
                                }
                                .background(Color.docWhite)
                                .cornerRadius(8)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(.docGrey, lineWidth: 1)
                                }
                                .padding(.horizontal)
                                .onTapGesture {
                                    let id = viewModel.sortedModels[index].id
                                    let user = viewModel.getUser(id: id)
                                    coordinator.push(.doctor, user: user)
                                }
                            }
                        }
                    }
                }
                .background(Color.docLightgray)
                .searchable(text: $viewModel.searchText)
                .modifyNavigation(title: "Педиатры") {
                    print("Нажата кнопка назад на главном экране")
                    coordinator.pop()
                }
            }.navigationBarBackButtonHidden(true)
        } else {
            ProgressView()
        }
    }
    
}

#Preview {
    MainView(viewModel: .prewiev)
}
