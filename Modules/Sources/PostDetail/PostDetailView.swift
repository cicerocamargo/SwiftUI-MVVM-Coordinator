import Core
import SwiftUI

public struct PostDetailView: View {
    @ObservedObject var viewModel: PostDetailViewModel

    public init(viewModel: PostDetailViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(viewModel.post.title).font(.title)
                HStack {
                    Text("Criado por:")
                    Button(action: viewModel.showUserDetail) {
                        Text(viewModel.author.username)
                    }.foregroundColor(.blue)
                }
            }
            .padding(.vertical)
            .buttonStyle(PlainButtonStyle())

            Text(viewModel.post.body).font(.body)
        }        
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            PostDetailView(
                viewModel: .init(
                    post: User.cicero.posts[0],
                    author: .cicero
                )
            )
        }
    }
}
