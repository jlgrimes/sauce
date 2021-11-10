// swiftlint:disable all
import Amplify
import Foundation

extension Entry {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case userID
    case time
    case place
    case order
    case rating
    case cuisine
    case price
    case method
    case thoughts
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
      .field(entry.userID, is: .required, ofType: .string),
      .field(entry.time, is: .required, ofType: .dateTime),
      .field(entry.place, is: .required, ofType: .embedded(type: PlaceData.self)),
      .field(entry.order, is: .required, ofType: .string),
      .field(entry.rating, is: .required, ofType: .int),
      .field(entry.cuisine, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(entry.price, is: .optional, ofType: .int),
      .field(entry.method, is: .optional, ofType: .enum(type: MethodOfEat.self)),
      .field(entry.thoughts, is: .optional, ofType: .string),
      .field(entry.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(entry.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}