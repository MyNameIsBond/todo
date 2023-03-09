
import SwiftUI

struct CategoryTodoContainer: View {
  @State var items: Instance = .init(items: [Items(checked: false, content: "Milk")], category: "Shopping")
  
  var body: some View {
    VStack {
      Text(items.category)
      List(items.items) { item in
        HStack {
          Toggle(item.content, isOn: item.checked)
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
