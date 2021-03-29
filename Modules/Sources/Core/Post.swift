import Foundation

public struct Post: Identifiable, Hashable {
    public init(id: UUID, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }

    public let id: UUID
    public let title: String
    public let body: String
}
