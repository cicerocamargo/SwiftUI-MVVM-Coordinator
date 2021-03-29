import Core
import Combine
import Foundation

public class UserProfileViewModel: ObservableObject {
    public let user: User
    public var selectPost: ((Post) -> Void)?

    public init(user: User) {
        self.user = user
    }
}
