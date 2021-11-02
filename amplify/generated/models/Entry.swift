// swiftlint:disable all
import Amplify
import Foundation

public struct Entry: Model {
  public let id: String
  public var place: PlaceData
  public var order: String
  public var rating: Int
  public var cuisine: String?
  public var price: Int?
  public var method: MethodOfEat?
  public var thoughts: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      place: PlaceData,
      order: String,
      rating: Int,
      cuisine: String? = nil,
      price: Int? = nil,
      method: MethodOfEat? = nil,
      thoughts: String? = nil) {
    self.init(id: id,
      place: place,
      order: order,
      rating: rating,
      cuisine: cuisine,
      price: price,
      method: method,
      thoughts: thoughts,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      place: PlaceData,
      order: String,
      rating: Int,
      cuisine: String? = nil,
      price: Int? = nil,
      method: MethodOfEat? = nil,
      thoughts: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.place = place
      self.order = order
      self.rating = rating
      self.cuisine = cuisine
      self.price = price
      self.method = method
      self.thoughts = thoughts
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}