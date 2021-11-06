// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "591b6ac907611fb1e94d7355cacad4ad"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Entry.self)
  }
}