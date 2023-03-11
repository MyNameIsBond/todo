
import SwiftUI

struct AddView: View {
  
  @State var text: String = ""
  @StateObject var data: Instance
  @Environment(\.presentationMode) var presentationMode
  @State private var myAlert: Bool = false
  
  var body: some View {
    VStack {
      Text("Add a new to do.")
      TextField("type here...", text: $text)
      Button("Add") {
        if text.isEmpty {
          myAlert = true
        } else {
          data.addNewItem(text)
          text = ""
          presentationMode.wrappedValue.dismiss()
        }
      }.alert(isPresented: $myAlert) {
        Alert(title: Text("Your todo was empty"), message: Text("make sure you add something to the todo"), dismissButton: .default(Text("ok")))
      }
    }.padding()
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    AddView(data: Instance.setUpItems())
  }
}
