
import SwiftUI

struct CategoryTodoContainer: View {
  @ObservedObject var instance: Instance = Instance.setUpItems()
  var body: some View {
      List {
        ForEach(instance.items) { item in
          Text(item.content)
        }.onDelete(perform: instance.deleteItem)
          .onMove(perform: instance.onMove)
          
      }
  }
}

struct CategoryTodoContainer_Previews: PreviewProvider {
  static var previews: some View {
    CategoryTodoContainer()
  }
}
