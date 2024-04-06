import SwiftUI
import Firebase

struct WelcomeView: View {
    var body: some View {
        ZStack{
            if Auth.auth().currentUser != nil {
                HomeView()
            } else {
                SignInSignUpButtonView()
            }
        }
    }
}
