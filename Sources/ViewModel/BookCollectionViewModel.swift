import Foundation
import Combine

internal class BookCollectionViewModel: ObservableObject {
    private let restfulApi: URL = .init(string: Bundle.main.object(forInfoDictionaryKey: "RESTfulAPI") as! String)!.appendingPathComponent("books")

    @Published
    internal var books: [Book] = []

    func find() async {
        guard let (data, _) = try? await URLSession.shared.data(from: restfulApi) else { return }
        books = (try? JSONDecoder().decode([Book].self, from: data)) ?? []
    }

    func create(book: Book) async {
        var request: URLRequest = .init(url: restfulApi)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(book)

        try? await URLSession.shared.data(for: request)
    }

    func delete(id: String) async {
        var request: URLRequest = .init(url: restfulApi.appending(path: id))
        request.httpMethod = "DELETE"

        try? await URLSession.shared.data(for: request)
    }

    func update(id: String, with book: Book) async {
        var request: URLRequest = .init(url: restfulApi.appending(path: id))
        request.httpMethod = "PUT"
        request.httpBody = try? JSONEncoder().encode(book)

        try? await URLSession.shared.data(for: request)
    }
}
