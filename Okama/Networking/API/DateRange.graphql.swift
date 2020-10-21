// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class DateRangeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query DateRange($assetName: String) {
      portfolio_asset(name: $assetName) {
        __typename
        return_values {
          __typename
          period {
            __typename
            min
            max
          }
        }
        close {
          __typename
          period {
            __typename
            min
            max
          }
        }
      }
    }
    """

  public let operationName: String = "DateRange"

  public var assetName: String?

  public init(assetName: String? = nil) {
    self.assetName = assetName
  }

  public var variables: GraphQLMap? {
    return ["assetName": assetName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("portfolio_asset", arguments: ["name": GraphQLVariable("assetName")], type: .object(PortfolioAsset.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(portfolioAsset: PortfolioAsset? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "portfolio_asset": portfolioAsset.flatMap { (value: PortfolioAsset) -> ResultMap in value.resultMap }])
    }

    public var portfolioAsset: PortfolioAsset? {
      get {
        return (resultMap["portfolio_asset"] as? ResultMap).flatMap { PortfolioAsset(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "portfolio_asset")
      }
    }

    public struct PortfolioAsset: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PortfolioAsset"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("return_values", type: .object(ReturnValue.selections)),
          GraphQLField("close", type: .object(Close.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(returnValues: ReturnValue? = nil, close: Close? = nil) {
        self.init(unsafeResultMap: ["__typename": "PortfolioAsset", "return_values": returnValues.flatMap { (value: ReturnValue) -> ResultMap in value.resultMap }, "close": close.flatMap { (value: Close) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var returnValues: ReturnValue? {
        get {
          return (resultMap["return_values"] as? ResultMap).flatMap { ReturnValue(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "return_values")
        }
      }

      public var close: Close? {
        get {
          return (resultMap["close"] as? ResultMap).flatMap { Close(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "close")
        }
      }

      public struct ReturnValue: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TimeSeries"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("period", type: .object(Period.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(period: Period? = nil) {
          self.init(unsafeResultMap: ["__typename": "TimeSeries", "period": period.flatMap { (value: Period) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var period: Period? {
          get {
            return (resultMap["period"] as? ResultMap).flatMap { Period(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "period")
          }
        }

        public struct Period: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Period"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("min", type: .scalar(String.self)),
              GraphQLField("max", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(min: String? = nil, max: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Period", "min": min, "max": max])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var min: String? {
            get {
              return resultMap["min"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "min")
            }
          }

          public var max: String? {
            get {
              return resultMap["max"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "max")
            }
          }
        }
      }

      public struct Close: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TimeSeries"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("period", type: .object(Period.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(period: Period? = nil) {
          self.init(unsafeResultMap: ["__typename": "TimeSeries", "period": period.flatMap { (value: Period) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var period: Period? {
          get {
            return (resultMap["period"] as? ResultMap).flatMap { Period(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "period")
          }
        }

        public struct Period: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Period"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("min", type: .scalar(String.self)),
              GraphQLField("max", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(min: String? = nil, max: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Period", "min": min, "max": max])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var min: String? {
            get {
              return resultMap["min"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "min")
            }
          }

          public var max: String? {
            get {
              return resultMap["max"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "max")
            }
          }
        }
      }
    }
  }
}
