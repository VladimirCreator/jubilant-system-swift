import SwiftUI

internal struct BookCell: View {
    internal let title: String
    internal let author: String
    internal let yearOfPublication: Int

    internal var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("\(yearOfPublication)")
        }
    }
}
