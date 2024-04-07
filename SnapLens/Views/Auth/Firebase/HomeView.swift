import SwiftUI
import Firebase

struct HomeView: View {
    @Binding var currentView: ContentView.Views
    var body: some View {
        ZStack{
            if Auth.auth().currentUser != nil {
                DashboardView(currentView: $currentView)
            } else {
                SignInSignUpButtonView()
            }
        }
    }
}
