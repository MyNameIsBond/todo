
import SwiftUI

struct CategoryTodoContainer: View {
  @ObservedObject var instance: Instance = .init(items: [Items(checked: false, content: "Milk"), .init(checked: true, content: "Snacks")], category: "Shopping")
  @State private var ela = false
  var body: some View {
      List(instance.items) { item in
          Text(item.content)
      }
  }
}

struct CategoryTodoContainer_Previews: PreviewProvider {
  static var previews: some View {
    CategoryTodoContainer()
  }
}
