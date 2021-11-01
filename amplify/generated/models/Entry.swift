// swiftlint:disable all
import Amplify
import Foundation

public struct Entry: Model {
  public let id: String
  public var coordinate: [Double?]
  public var rating: Int
  public var cuisine: String?
  public var price: Int?
  public var method: MethodOfEat?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      coordinate: [Double?] = [],
      rating: Int,
      cuisine: String? = nil,
      price: Int? = nil,
      method: MethodOfEat? = nil) {
    self.init(id: id,
      coordinate: coordinate,
      rating: rating,
      cuisine: cuisine,
      price: price,
      method: method,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      coordinate: [Double?] = [],
      rating: Int,
      cuisine: String? = nil,
      price: Int? = nil,
      method: MethodOfEat? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.coordinate = coordinate
      self.rating = rating
      self.cuisine = cuisine
      self.price = price
      self.method = method
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}