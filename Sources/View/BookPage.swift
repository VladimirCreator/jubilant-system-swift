import SwiftUI

internal struct BookPage: View {
    @Binding internal var title: String
    @Binding internal var author: String
    @Binding internal var yearOfPublication: Int

    internal var body: some View {
        Form {
            Section {
                TextField("Название", text: $title)
                TextField("Автор", text: $author)
                DatePicker("Год публикации", selection: .constant(.init()), displayedComponents: [.date])
            }
        }
        .navigationTitle(title)
    }
}
