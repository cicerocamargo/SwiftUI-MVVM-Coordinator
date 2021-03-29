import SwiftUI
import UserProfile

@main
struct StateObjectApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                UserProfileCoordinator(
                    viewModel: .init(
                        userProfileViewModel: UserProfileViewModel(user: .cicero)
                    )
                )
            }
        }
    }
}
