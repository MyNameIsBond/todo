
import SwiftUI

struct CategoryTodoContainer: View {
  @ObservedObject var instance: Instance = Instance.setUpItems()
  @State private var  editing: Bool = false
  @State private var dolor: Bool = false
  
  var body: some View {
    List {
      ForEach(instance.items) { item in
        Text(item.content)
      }.onDelete(perform: instance.deleteItem)
        .onMove(perform: instance.onMove)
    }.toolbar {
      ToolbarItem {
        Button("Add") {
          editing = true
        }.sheet(isPresented: $editing) {
          AddView(data: instance)
            .toolbar {
              ToolbarItem(placement: .status) {
                Text("Add a new to do")
              }
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
