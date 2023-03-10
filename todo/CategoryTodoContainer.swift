
import SwiftUI

struct CategoryTodoContainer: View {
  @ObservedObject var instance: Instance = .init(items: [Items(checked: false, content: "Milk"), .init(checked: true, content: "Snacks")], category: "Shopping")
  @State private var ela = false
  var body: some View {
    VStack {
      List(instance.items) { item in
        Toggle(isOn: $instance.items[instance.items.firstIndex(where: { $0.id == item.id })!].checked) {
          Text(item.content)
        }
      }
    }
  }
}

struct CategoryTodoContainer_Previews: PreviewProvider {
  static var previews: some View {
    CategoryTodoContainer()
  }
}
