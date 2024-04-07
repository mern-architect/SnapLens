import SwiftUI

struct SplashView: View {
    
    @Binding var currentView: ContentView.Views
    
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
                let userData = try JSONDecoder().decode(SavedUserData.self, from: savedData)
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
            currentView = .dashboard
        }
    }
    
    private func navigateToLogin() {
        DispatchQueue.main.async {
            currentView = .login
        }
    }
}
