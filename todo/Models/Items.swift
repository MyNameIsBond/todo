
import Foundation


class Items: Identifiable, ObservableObject {
  var id: UUID
  @Published var checked: Bool
  var content: String
  var date: Date {
    return Date.now
  }
  
  init(checked: Bool, content: String) {
    self.id = UUID()
    self.checked = checked
    self.content = content
  }
}

class Instance: ObservableObject {
  var items: [Items]
  var category: String
  
  init(items: [Items], category: String) {
    self.items = items
    self.category = category
  }
  
  static func setUpItems() -> Instance {
    return Instance(items: [Items(checked: false, content: "Milk"), .init(checked: true, content: "Snacks")], category: "Shopping")
  }
  
  func deleteItem(_ index: IndexSet) {
    items.remove(atOffsets: index)
    print(index)
  }
  
  func onMove(from source:IndexSet, to destination: Int) {
    items.move(fromOffsets: source, toOffset: destination)
  }
  
}
