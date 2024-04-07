import SwiftUI

struct SplashView: View {
    @EnvironmentObject var navigationState: NavigationState

    private let savedUserDataKey = "SavedUserData"

    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            Text("My App")
                .foregroundColor(.white)
                .font(.title)
        }
        .onAppear {
            loadSavedUserData()
        }
    }

    private func loadSavedUserData() {
        if let savedData = UserDefaults.standard.data(forKey: savedUserDataKey) {
            do {
                _ = try JSONDecoder().decode(SavedUserData.self, from: savedData)
                navigateToDashboard()
            } catch {
                navigateToLogin()
            }
        } else {
            navigateToLogin()
        }
    }

    private func navigateToDashboard() {
        DispatchQueue.main.async {
            navigationState.navigate(to: .dashboard)
        }
    }

    private func navigateToLogin() {
        DispatchQueue.main.async {
            navigationState.navigate(to: .login)
        }
    }
}
