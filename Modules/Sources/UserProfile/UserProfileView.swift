import SwiftUI

public struct UserProfileView: View {
    @ObservedObject var viewModel: UserProfileViewModel

    public init(viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        List {
            userSection
            postsSection
        }        
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(viewModel.user.username)
    }

    private var userSection: some View {
        Section {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(.vertical)
                Spacer()
                VStack {
                    Text("\(viewModel.user.posts.count)").bold()
                    Text("Publicações").bold()
                }
                Spacer()
            }
        }
    }

    private var postsSection: some View {
        Section(header: Text("Publicações")) {
            ForEach(viewModel.user.posts) { post in
                VStack(alignment: .leading, spacing: 8) {
                    Text(post.title).font(.title3)
                    Text(post.body).lineLimit(3).font(.caption)
                }
                .padding(.vertical, 8)
                .overlay(
                    Button(action: { viewModel.selectPost?(post) }) {
                        EmptyView()
                    }
                )
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserProfileView(viewModel: .init(user: .cicero))
        }
    }
}
