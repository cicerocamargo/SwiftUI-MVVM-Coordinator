import Core
import Foundation

public final class PostDetailViewModel: ObservableObject {
    public let post: Post
    public let author: User
    public var showUserDetail: () -> Void = {}

    public init(post: Post, author: User) {
        self.post = post
        self.author = author
    }
}
