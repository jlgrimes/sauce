// swiftlint:disable all
import Amplify
import Foundation

extension Entry {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case coordinate
    case rating
    case cuisine
    case price
    case method
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let entry = Entry.keys
    
    model.pluralName = "Entries"
    
    model.fields(
      .id(),
      .field(entry.coordinate, is: .required, ofType: .embeddedCollection(of: Double.self)),
      .field(entry.rating, is: .required, ofType: .int),
      .field(entry.cuisine, is: .optional, ofType: .string),
      .field(entry.price, is: .optional, ofType: .int),
      .field(entry.method, is: .optional, ofType: .enum(type: MethodOfEat.self)),
      .field(entry.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(entry.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}