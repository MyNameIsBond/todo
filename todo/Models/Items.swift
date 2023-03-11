
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
  @Published var items: [Items]
  
  init(items: [Items]) {
    self.items = items
  }
  
  static func setUpItems() -> Instance {
    return Instance(items: [Items(checked: false, content: "Milk"), .init(checked: false, content: "Snacks")])
  }
  
  func deleteItem(_ index: IndexSet) {
    items.remove(atOffsets: index)
  }
  
  func onMove(from source:IndexSet, to destination: Int) {
    items.move(fromOffsets: source, toOffset: destination)
  }
  
  func addNewItem(_ item: String) {
    items.append(.init(checked: false, content: item))
  }
  
  func tottleChecked(_ item: Items) {
    item.checked.toggle()
  }
  
}
