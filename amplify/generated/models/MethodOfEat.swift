// swiftlint:disable all
import Amplify
import Foundation

public enum MethodOfEat: String, EnumPersistable {
  case dineIn = "DINE_IN"
  case eatAt = "EAT_AT"
  case pickup = "PICKUP"
  case delivery = "DELIVERY"
}