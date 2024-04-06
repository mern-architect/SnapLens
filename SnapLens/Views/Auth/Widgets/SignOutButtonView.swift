import SwiftUI
import Firebase

struct SignOutButton: View {
    var body: some View {
        Button(action: signOut) {
            Text("Sign Out")
                .foregroundColor(Color.white)
                .padding()
        }
        .background(Color.green)
        .cornerRadius(5)
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
