import SwiftUI

struct ContentView: View {
        
    var body: some View {
            TabView {
                CoordinatorView()
                .tabItem {
                    Image(.main)
                    Text("Главная")
                }
                
                CalendarView()
                    .tabItem {
                        Image(.calendar)
                        Text("Приемы")
                    }
                ChatView()
                    .tabItem {
                        Image(.chat)
                        Text("Чат")
                    }
                ProfileView()
                    .tabItem {
                        Image(.profile)
                        Text("Профиль")
                    }
            }
            .accentColor(.docPink)
            .onAppear() {
                UITabBar.appearance().backgroundColor = .docWhite
            }
        }
}

#Preview {
    ContentView()
}

