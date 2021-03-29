public struct User {
    public init(name: String, username: String, posts: [Post]) {
        self.name = name
        self.username = username
        self.posts = posts
    }

    public let name: String
    public let username: String
    public let posts: [Post]
}

#if DEBUG
public extension User {
    static let cicero = User(
        name: "Cícero Camargo",
        username: "cicerocamargo.dev",
        posts: [
            Post(
                id: .init(),
                title: "Começando com SwiftUI",
                body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            ),
            Post(
                id: .init(),
                title: "SwiftUI + MVVM: Testes Unitários",
                body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            )
        ]
    )
}
#endif
