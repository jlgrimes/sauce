// swiftlint:disable all
import Amplify
import Foundation

extension PlaceData {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case coordinate
    case name
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let placeData = PlaceData.keys
    
    model.pluralName = "PlaceData"
    
    model.fields(
      .field(placeData.coordinate, is: .required, ofType: .embeddedCollection(of: Double.self)),
      .field(placeData.name, is: .required, ofType: .string)
    )
    }
}