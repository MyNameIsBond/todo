
import Foundation


enum Checked {
  case cheched
  case unchecked
}


struct Items: Identifiable {
  var id: UUID = UUID()
  var checked: Bool
  var content: String
  var date: Date {
    return Date.now
  }
}

struct Instance {
  var items: [Items]
  var category: String
}

