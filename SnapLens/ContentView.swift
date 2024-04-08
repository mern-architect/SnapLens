import SwiftUI
import Combine

enum NavigationViewState: Hashable {
    case splash, login, signup, dashboard, camera
}

struct ContentView: View {
    @StateObject private var navigationState = NavigationState()

    var body: some View {
        NavigationStack(path: $navigationState.navigationPath) {
            content
            .navigationDestination(for: NavigationViewState.self) { state in
                navigationDestination(for: state)
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch navigationState.currentNavigationState {
        case .splash:
            SplashView(navigationState: navigationState)
        case .login:
            LoginView(navigationState: navigationState)
        case .signup:
            SignupView(navigationState: navigationState)
        case .dashboard:
            DashboardView(navigationState: navigationState)
        case .camera:
            CameraView(navigationState: navigationState)
        }
    }

    @ViewBuilder
    private func navigationDestination(for state: NavigationViewState) -> some View {
        switch state {
        case .splash:
            SplashView(navigationState: navigationState)
        case .login:
            LoginView(navigationState: navigationState)
        case .signup:
            SignupView(navigationState: navigationState)
        case .dashboard:
            DashboardView(navigationState: navigationState)
        case .camera:
            CameraView(navigationState: navigationState)
        }
    }
}

class NavigationState: ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var currentNavigationState: NavigationViewState = .splash

    func replace(with state: NavigationViewState) {
        currentNavigationState = state
        navigationPath = NavigationPath()
        navigationPath.append(state)
    }

    func navigate(to state: NavigationViewState) {
        currentNavigationState = state
        navigationPath.append(state)
    }
}
