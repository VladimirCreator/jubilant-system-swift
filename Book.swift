internal struct Book: Identifiable, Hashable, Codable {
    internal var id: String
    internal var title: String
    internal var author: String
    internal var yearOfPublication: Int
}
