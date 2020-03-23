import SwiftUI

struct ImageInfo: View {

  @EnvironmentObject var dataStore: DataStore

  var image: ImageModel! {
    dataStore.selectedImage
  }

  var info: some View {
    VStack(alignment: .leading) {
      Text("Actual width: \(image.size.width, specifier: "%.2f")")
      Text("Actual height: \(image.size.height, specifier: "%.2f")")
      Text("Aspect ratio: \(image.aspectRatio, specifier: "%.3f")")
      Text("Scaled width: \(image.currentScaledSize.width, specifier: "%.2f")")
      Text("Scaled height: \(image.currentScaledSize.height, specifier: "%.2f")")
      Text("Scale ratio: \(image.currentScale, specifier: "%.3f")")
    }
    .padding()
    .font(.system(.body, design: .monospaced))
  }
  var inspector: some View {
    ScrollView(.vertical) {
      VStack {
        //TextField("Image name", text: $dataStore.annotatedImage!.imagefilename)
        Text("\(dataStore.selectedImage!.filename)")
        .padding()
        Divider()
        info
      }
    }
  }
  var body: some View {
    Group {
      if image == nil {
        Text("Please add/select an image.")
      } else {
        inspector
      }
    }
  }

}


struct ImageInfo_Previews: PreviewProvider {
  static var previews: some View {
    ImageInfo()
    .environmentObject(DataStore())
  }
}
