import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var navigationState = NavigationState()

    var body: some View {
        NavigationStack(path: $navigationState.navigationPath) {
            content
                .environmentObject(navigationState)
        }
    }

    @ViewBuilder
    private var content: some View {
        switch navigationState.currentNavigationState {
        case .splash:
            SplashView()
        case .login:
            LoginView()
        case .signup:
            SignupView()
        case .dashboard:
            DashboardView()
        case .camera:
            CameraView()
        }
    }
}

class NavigationState: ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var currentNavigationState: NavigationViewState = .splash

    enum NavigationViewState: Hashable {
        case splash, login, signup, dashboard, camera
    }

    func navigate(to state: NavigationViewState) {
        currentNavigationState = state
        navigationPath.append(state)
    }
}
