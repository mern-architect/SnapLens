import SwiftUI
import Firebase

struct HomeView: View {
    @StateObject private var navigationState = NavigationState()
    
    var body: some View {
        ZStack{
            if Auth.auth().currentUser != nil {
                DashboardView(navigationState: navigationState)
            } else {
                SignInSignUpButtonView()
            }
        }
    }
}
