// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PortfolioPerformanceQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query PortfolioPerformance($assetInputs: [PortfolioAssetInput]!, $startPeriod: String, $currency: Currency!) {
      portfolio(assets: $assetInputs, start_period: $startPeriod, currency: $currency) {
        __typename
        ytdReturn: return_values(kind: year_to_date) {
          __typename
          values
        }
        yearlyRisk: risk(period: yearly)
      }
    }
    """

  public let operationName: String = "PortfolioPerformance"

  public var assetInputs: [PortfolioAssetInput?]
  public var startPeriod: String?
  public var currency: Currency

  public init(assetInputs: [PortfolioAssetInput?], startPeriod: String? = nil, currency: Currency) {
    self.assetInputs = assetInputs
    self.startPeriod = startPeriod
    self.currency = currency
  }

  public var variables: GraphQLMap? {
    return ["assetInputs": assetInputs, "startPeriod": startPeriod, "currency": currency]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("portfolio", arguments: ["assets": GraphQLVariable("assetInputs"), "start_period": GraphQLVariable("startPeriod"), "currency": GraphQLVariable("currency")], type: .object(Portfolio.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(portfolio: Portfolio? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "portfolio": portfolio.flatMap { (value: Portfolio) -> ResultMap in value.resultMap }])
    }

    public var portfolio: Portfolio? {
      get {
        return (resultMap["portfolio"] as? ResultMap).flatMap { Portfolio(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "portfolio")
      }
    }

    public struct Portfolio: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Portfolio"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("return_values", alias: "ytdReturn", arguments: ["kind": "year_to_date"], type: .object(YtdReturn.selections)),
          GraphQLField("risk", alias: "yearlyRisk", arguments: ["period": "yearly"], type: .scalar(Double.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ytdReturn: YtdReturn? = nil, yearlyRisk: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "Portfolio", "ytdReturn": ytdReturn.flatMap { (value: YtdReturn) -> ResultMap in value.resultMap }, "yearlyRisk": yearlyRisk])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ytdReturn: YtdReturn? {
        get {
          return (resultMap["ytdReturn"] as? ResultMap).flatMap { YtdReturn(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "ytdReturn")
        }
      }

      public var yearlyRisk: Double? {
        get {
          return resultMap["yearlyRisk"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "yearlyRisk")
        }
      }

      public struct YtdReturn: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TimeSeries"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("values", type: .list(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(values: [Double?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "TimeSeries", "values": values])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var values: [Double?]? {
          get {
            return resultMap["values"] as? [Double?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "values")
          }
        }
      }
    }
  }
}
