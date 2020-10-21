// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct PortfolioAssetWeightedInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - weight
  ///   - name
  public init(weight: Swift.Optional<Double?> = nil, name: Swift.Optional<String?> = nil) {
    graphQLMap = ["weight": weight, "name": name]
  }

  public var weight: Swift.Optional<Double?> {
    get {
      return graphQLMap["weight"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight")
    }
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }
}

public enum Currency: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case rub
  case usd
  case eur
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "rub": self = .rub
      case "usd": self = .usd
      case "eur": self = .eur
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .rub: return "rub"
      case .usd: return "usd"
      case .eur: return "eur"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Currency, rhs: Currency) -> Bool {
    switch (lhs, rhs) {
      case (.rub, .rub): return true
      case (.usd, .usd): return true
      case (.eur, .eur): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Currency] {
    return [
      .rub,
      .usd,
      .eur,
    ]
  }
}

public struct PortfolioPeriod: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - start
  public init(start: String) {
    graphQLMap = ["start": start]
  }

  public var start: String {
    get {
      return graphQLMap["start"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "start")
    }
  }
}

public struct PortfolioAssetInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - weight
  public init(name: Swift.Optional<String?> = nil, weight: Swift.Optional<Double?> = nil) {
    graphQLMap = ["name": name, "weight": weight]
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var weight: Swift.Optional<Double?> {
    get {
      return graphQLMap["weight"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight")
    }
  }
}
