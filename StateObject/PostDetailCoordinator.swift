import Foundation
import PostDetail
import SwiftUI
import UserProfile

struct PostDetailCoordinator: View {
    @ObservedObject var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        PostDetailView(viewModel: viewModel.postDetailViewModel)
            .overlay(authorNavLink)
    }

    private var authorNavLink: some View {
        NavigationLink(
            destination: viewModel.userProfileViewModel.map(UserProfileCoordinator.init),
            isActive: .init(
                get: { viewModel.userProfileViewModel != nil },
                set: { isActive in
                    if !isActive {
                        viewModel.userProfileViewModel = nil
                    }
                }
            ),
            label: EmptyView.init
        )
    }
}

extension PostDetailCoordinator {
    class ViewModel: ObservableObject {
        let postDetailViewModel: PostDetailViewModel
        @Published var userProfileViewModel: UserProfileCoordinator.ViewModel?

        init(postDetailViewModel: PostDetailViewModel) {
            self.postDetailViewModel = postDetailViewModel
            postDetailViewModel.showUserDetail = { [weak self] in
                guard let user = self?.postDetailViewModel.author else { return }
                self?.userProfileViewModel = .init(
                    userProfileViewModel: .init(user: user)
                )
            }
        }
    }
}
