import SwiftUI

struct ContentView: View {
    @State private var currentView: Views = .splash
    
    enum Views {
        case splash, login, signup, dashboard
    }
    
    var body: some View {
        NavigationStack {
            Group {
                switch currentView {
                    case .splash:
                        SplashView(currentView: $currentView)
                    case .login:
                        LoginView(currentView: $currentView)
                    case .signup:
                        SignupView(currentView: $currentView)
                    case .dashboard:
                        DashboardView(currentView: $currentView)
                }
            }
            .transition(.slide)
        }
    }
}
