// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "3b71c239569cef9e77c56a3035db6ee8"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Entry.self)
  }
}