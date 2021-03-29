import Combine
import Foundation
import SwiftUI
import UserProfile

struct UserProfileCoordinator: View {
    @ObservedObject var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        UserProfileView(viewModel: viewModel.userProfileViewModel)
            .overlay(postNavLink)
    }

    private var postNavLink: some View {
        NavigationLink(
            destination: viewModel.postDetailViewModel.map(PostDetailCoordinator.init),
            isActive: .init(
                get: { viewModel.postDetailViewModel != nil },
                set: { isActive in
                    if !isActive {
                        viewModel.postDetailViewModel = nil
                    }
                }
            ),
            label: EmptyView.init
        )
    }
}

extension UserProfileCoordinator {
    class ViewModel: ObservableObject {
        let userProfileViewModel: UserProfileViewModel
        @Published var postDetailViewModel: PostDetailCoordinator.ViewModel?

        init(userProfileViewModel: UserProfileViewModel) {
            self.userProfileViewModel = userProfileViewModel
            let author = userProfileViewModel.user

            userProfileViewModel.selectPost = { [weak self] post in
                self?.postDetailViewModel = .init(
                    postDetailViewModel: .init(
                        post: post,
                        author: author
                    )
                )
            }
        }
    }
}
