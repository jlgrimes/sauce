// swiftlint:disable all
import Amplify
import Foundation

public struct PlaceData: Embeddable {
  var coordinate: [Double?]
  var name: String
}