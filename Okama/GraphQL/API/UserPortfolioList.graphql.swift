// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UserPortfolioListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserPortfolioList {
      me {
        __typename
        portfolios {
          __typename
          uuid
          composition: portfolio {
            __typename
            assets {
              __typename
              asset {
                __typename
                identifier {
                  __typename
                  name
                  full
                }
                short_name
              }
              weight
            }
            currency
            period_duration {
              __typename
              start_period
            }
          }
          performance: portfolio {
            __typename
            ytdReturn: return_values(kind: year_to_date) {
              __typename
              values
            }
            yearlyRisk: risk(period: yearly)
          }
          initial_amount
        }
      }
    }
    """

  public let operationName: String = "UserPortfolioList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("me", type: .object(Me.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CurrentUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("portfolios", type: .list(.object(Portfolio.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(portfolios: [Portfolio?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CurrentUser", "portfolios": portfolios.flatMap { (value: [Portfolio?]) -> [ResultMap?] in value.map { (value: Portfolio?) -> ResultMap? in value.flatMap { (value: Portfolio) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var portfolios: [Portfolio?]? {
        get {
          return (resultMap["portfolios"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Portfolio?] in value.map { (value: ResultMap?) -> Portfolio? in value.flatMap { (value: ResultMap) -> Portfolio in Portfolio(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Portfolio?]) -> [ResultMap?] in value.map { (value: Portfolio?) -> ResultMap? in value.flatMap { (value: Portfolio) -> ResultMap in value.resultMap } } }, forKey: "portfolios")
        }
      }

      public struct Portfolio: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CurrentUserPortfolio"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("uuid", type: .scalar(String.self)),
            GraphQLField("portfolio", alias: "composition", type: .object(Composition.selections)),
            GraphQLField("portfolio", alias: "performance", type: .object(Performance.selections)),
            GraphQLField("initial_amount", type: .scalar(Double.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(uuid: String? = nil, composition: Composition? = nil, performance: Performance? = nil, initialAmount: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "CurrentUserPortfolio", "uuid": uuid, "composition": composition.flatMap { (value: Composition) -> ResultMap in value.resultMap }, "performance": performance.flatMap { (value: Performance) -> ResultMap in value.resultMap }, "initial_amount": initialAmount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var uuid: String? {
          get {
            return resultMap["uuid"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "uuid")
          }
        }

        public var composition: Composition? {
          get {
            return (resultMap["composition"] as? ResultMap).flatMap { Composition(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "composition")
          }
        }

        public var performance: Performance? {
          get {
            return (resultMap["performance"] as? ResultMap).flatMap { Performance(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "performance")
          }
        }

        public var initialAmount: Double? {
          get {
            return resultMap["initial_amount"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "initial_amount")
          }
        }

        public struct Composition: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Portfolio"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("assets", type: .list(.object(Asset.selections))),
              GraphQLField("currency", type: .scalar(Currency.self)),
              GraphQLField("period_duration", type: .object(PeriodDuration.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(assets: [Asset?]? = nil, currency: Currency? = nil, periodDuration: PeriodDuration? = nil) {
            self.init(unsafeResultMap: ["__typename": "Portfolio", "assets": assets.flatMap { (value: [Asset?]) -> [ResultMap?] in value.map { (value: Asset?) -> ResultMap? in value.flatMap { (value: Asset) -> ResultMap in value.resultMap } } }, "currency": currency, "period_duration": periodDuration.flatMap { (value: PeriodDuration) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var assets: [Asset?]? {
            get {
              return (resultMap["assets"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Asset?] in value.map { (value: ResultMap?) -> Asset? in value.flatMap { (value: ResultMap) -> Asset in Asset(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Asset?]) -> [ResultMap?] in value.map { (value: Asset?) -> ResultMap? in value.flatMap { (value: Asset) -> ResultMap in value.resultMap } } }, forKey: "assets")
            }
          }

          public var currency: Currency? {
            get {
              return resultMap["currency"] as? Currency
            }
            set {
              resultMap.updateValue(newValue, forKey: "currency")
            }
          }

          public var periodDuration: PeriodDuration? {
            get {
              return (resultMap["period_duration"] as? ResultMap).flatMap { PeriodDuration(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "period_duration")
            }
          }

          public struct Asset: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PortfolioAssetWeighted"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("asset", type: .object(Asset.selections)),
                GraphQLField("weight", type: .scalar(Double.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(asset: Asset? = nil, weight: Double? = nil) {
              self.init(unsafeResultMap: ["__typename": "PortfolioAssetWeighted", "asset": asset.flatMap { (value: Asset) -> ResultMap in value.resultMap }, "weight": weight])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var asset: Asset? {
              get {
                return (resultMap["asset"] as? ResultMap).flatMap { Asset(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "asset")
              }
            }

            public var weight: Double? {
              get {
                return resultMap["weight"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "weight")
              }
            }

            public struct Asset: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PortfolioAsset"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("identifier", type: .object(Identifier.selections)),
                  GraphQLField("short_name", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(identifier: Identifier? = nil, shortName: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "PortfolioAsset", "identifier": identifier.flatMap { (value: Identifier) -> ResultMap in value.resultMap }, "short_name": shortName])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var identifier: Identifier? {
                get {
                  return (resultMap["identifier"] as? ResultMap).flatMap { Identifier(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "identifier")
                }
              }

              public var shortName: String? {
                get {
                  return resultMap["short_name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "short_name")
                }
              }

              public struct Identifier: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["FinancialSymbolId"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .scalar(String.self)),
                    GraphQLField("full", type: .scalar(String.self)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String? = nil, full: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "FinancialSymbolId", "name": name, "full": full])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var name: String? {
                  get {
                    return resultMap["name"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }

                public var full: String? {
                  get {
                    return resultMap["full"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "full")
                  }
                }
              }
            }
          }

          public struct PeriodDuration: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PeriodDuration"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("start_period", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(startPeriod: String) {
              self.init(unsafeResultMap: ["__typename": "PeriodDuration", "start_period": startPeriod])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var startPeriod: String {
              get {
                return resultMap["start_period"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "start_period")
              }
            }
          }
        }

        public struct Performance: GraphQLSelectionSet {
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
  }
}
