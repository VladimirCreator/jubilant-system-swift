import SwiftUI

internal struct BookCollection: View {
    @ObservedObject private var bookCollectionViewModel: BookCollectionViewModel = .init()

    @State private var isCreating: Bool = false
    @State private var newBook: Book = .init(id: "", title: "", author: "", yearOfPublication: 0)

    internal var body: some View {
        List($bookCollectionViewModel.books) { $book in
            NavigationLink {
                BookPage(title: $book.title, author: $book.author, yearOfPublication: $book.yearOfPublication)
                    .toolbar {
                        ToolbarItemGroup {
                            Button {
                                Task {
                                    await bookCollectionViewModel.update(id: book.id, with: book)
                                }
                            } label: {
                                Label("Обновить", systemImage: "arrow.triangle.2.circlepath")
                            }
                            Button {
                                Task {
                                    await bookCollectionViewModel.delete(id: book.id)
                                }
                            } label: {
                                Label("Удалить", systemImage: "trash")
                            }
                        }
                    }
            } label: {
                BookCell(title: book.title, author: book.author, yearOfPublication: book.yearOfPublication)
            }
        }
        .onAppear {
            Task {
                await bookCollectionViewModel.find()
            }
        }
        .navigationTitle("Книги")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button { isCreating.toggle() } label: {
                    Label("Добавить", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $isCreating) {
            NavigationStack {
                BookPage(title: $newBook.title, author: $newBook.author, yearOfPublication: $newBook.yearOfPublication)
                    .toolbar {
                        ToolbarItem {
                            Button {
                                Task {
                                    await bookCollectionViewModel.create(book: newBook)
                                }
                                isCreating.toggle()
                            } label: {
                                Label("Создать", systemImage: "checkmark")
                            }
                        }
                    }
            }
        }
    }
}
