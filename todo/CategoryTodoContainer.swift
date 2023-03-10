
import SwiftUI

struct CategoryTodoContainer: View {
  @ObservedObject var items: Instance = .init(items: [Items(checked: false, content: "Milk"), .init(checked: true, content: "Snacks")], category: "Shopping")
  
  var body: some View {
    VStack {
      Text(items.category)
      List(items.items) { item in
        HStack {
          Toggle(item.content, isOn: item.checked)          
          Text(item.content).onTapGesture {
            print(item.checked)
          }
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
