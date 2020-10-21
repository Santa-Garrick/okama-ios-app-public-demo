// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PortfolioAnalysisQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query PortfolioAnalysis($assetInputs: [PortfolioAssetInput]!, $startPeriod: String, $currency: Currency!, $initialAmount: Float) {
      portfolio(assets: $assetInputs, start_period: $startPeriod, currency: $currency) {
        __typename
        initial_amount
        currency
        period_duration {
          __typename
          years
          months
        }
        balance(initial_amount: $initialAmount) {
          __typename
          return_values {
            __typename
            values
          }
        }
        cumulativeReturn: return_values(kind: cumulative) {
          __typename
          values
        }
        combinedCumulativeReturns: return_values(kind: cumulative) {
          __typename
          combined {
            __typename
            period
            value
          }
        }
        ytdReturn: return_values(kind: year_to_date) {
          __typename
          values
        }
        annualReturns: return_values(kind: year_to_date) {
          __typename
          combined {
            __typename
            period
            value
          }
        }
        cagrs {
          __typename
          years_ago
          value
        }
        yearlyRisk: risk(period: yearly)
        cumInflation: inflation(kind: cumulative) {
          __typename
          values
        }
        combinedInflations: inflation(kind: values) {
          __typename
          combined {
            __typename
            period
            value
          }
        }
        gMeanInflation: inflation(kind: g_mean) {
          __typename
          values
        }
        realCumulativeReturn: return_values(kind: cumulative, real: true) {
          __typename
          values
        }
        realCAGR: cagrs(years_ago: 200, real: true) {
          __typename
          value
        }
        assets {
          __typename
          weight
          asset {
            __typename
            identifier {
              __typename
              full
            }
            short_name
            long_name
            initial_amount
            currency: currency_info {
              __typename
              selected
            }
            period_duration {
              __typename
              years
              months
            }
            balance(initial_amount: $initialAmount) {
              __typename
              values
            }
            cumulativeReturn: return_values(kind: cumulative) {
              __typename
              values
            }
            ytdReturn: return_values(kind: year_to_date) {
              __typename
              values
            }
            cagrs {
              __typename
              years_ago
              value
            }
            yearlyRisk: risk(period: yearly)
            cumInflation: inflation(kind: cumulative) {
              __typename
              values
            }
            gMeanInflation: inflation(kind: g_mean) {
              __typename
              values
            }
            realCumulativeReturn: return_values(kind: cumulative, real: true) {
              __typename
              values
            }
            realCAGR: cagrs(years_ago: 200, real: true) {
              __typename
              value
            }
            combinedCumulativeReturns: return_values(kind: cumulative) {
              __typename
              combined {
                __typename
                period
                value
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "PortfolioAnalysis"

  public var assetInputs: [PortfolioAssetInput?]
  public var startPeriod: String?
  public var currency: Currency
  public var initialAmount: Double?

  public init(assetInputs: [PortfolioAssetInput?], startPeriod: String? = nil, currency: Currency, initialAmount: Double? = nil) {
    self.assetInputs = assetInputs
    self.startPeriod = startPeriod
    self.currency = currency
    self.initialAmount = initialAmount
  }

  public var variables: GraphQLMap? {
    return ["assetInputs": assetInputs, "startPeriod": startPeriod, "currency": currency, "initialAmount": initialAmount]
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
          GraphQLField("initial_amount", type: .scalar(Double.self)),
          GraphQLField("currency", type: .scalar(Currency.self)),
          GraphQLField("period_duration", type: .object(PeriodDuration.selections)),
          GraphQLField("balance", arguments: ["initial_amount": GraphQLVariable("initialAmount")], type: .object(Balance.selections)),
          GraphQLField("return_values", alias: "cumulativeReturn", arguments: ["kind": "cumulative"], type: .object(CumulativeReturn.selections)),
          GraphQLField("return_values", alias: "combinedCumulativeReturns", arguments: ["kind": "cumulative"], type: .object(CombinedCumulativeReturn.selections)),
          GraphQLField("return_values", alias: "ytdReturn", arguments: ["kind": "year_to_date"], type: .object(YtdReturn.selections)),
          GraphQLField("return_values", alias: "annualReturns", arguments: ["kind": "year_to_date"], type: .object(AnnualReturn.selections)),
          GraphQLField("cagrs", type: .list(.object(Cagr.selections))),
          GraphQLField("risk", alias: "yearlyRisk", arguments: ["period": "yearly"], type: .scalar(Double.self)),
          GraphQLField("inflation", alias: "cumInflation", arguments: ["kind": "cumulative"], type: .object(CumInflation.selections)),
          GraphQLField("inflation", alias: "combinedInflations", arguments: ["kind": "values"], type: .object(CombinedInflation.selections)),
          GraphQLField("inflation", alias: "gMeanInflation", arguments: ["kind": "g_mean"], type: .object(GMeanInflation.selections)),
          GraphQLField("return_values", alias: "realCumulativeReturn", arguments: ["kind": "cumulative", "real": true], type: .object(RealCumulativeReturn.selections)),
          GraphQLField("cagrs", alias: "realCAGR", arguments: ["years_ago": 200, "real": true], type: .list(.object(RealCagr.selections))),
          GraphQLField("assets", type: .list(.object(Asset.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(initialAmount: Double? = nil, currency: Currency? = nil, periodDuration: PeriodDuration? = nil, balance: Balance? = nil, cumulativeReturn: CumulativeReturn? = nil, combinedCumulativeReturns: CombinedCumulativeReturn? = nil, ytdReturn: YtdReturn? = nil, annualReturns: AnnualReturn? = nil, cagrs: [Cagr?]? = nil, yearlyRisk: Double? = nil, cumInflation: CumInflation? = nil, combinedInflations: CombinedInflation? = nil, gMeanInflation: GMeanInflation? = nil, realCumulativeReturn: RealCumulativeReturn? = nil, realCagr: [RealCagr?]? = nil, assets: [Asset?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Portfolio", "initial_amount": initialAmount, "currency": currency, "period_duration": periodDuration.flatMap { (value: PeriodDuration) -> ResultMap in value.resultMap }, "balance": balance.flatMap { (value: Balance) -> ResultMap in value.resultMap }, "cumulativeReturn": cumulativeReturn.flatMap { (value: CumulativeReturn) -> ResultMap in value.resultMap }, "combinedCumulativeReturns": combinedCumulativeReturns.flatMap { (value: CombinedCumulativeReturn) -> ResultMap in value.resultMap }, "ytdReturn": ytdReturn.flatMap { (value: YtdReturn) -> ResultMap in value.resultMap }, "annualReturns": annualReturns.flatMap { (value: AnnualReturn) -> ResultMap in value.resultMap }, "cagrs": cagrs.flatMap { (value: [Cagr?]) -> [ResultMap?] in value.map { (value: Cagr?) -> ResultMap? in value.flatMap { (value: Cagr) -> ResultMap in value.resultMap } } }, "yearlyRisk": yearlyRisk, "cumInflation": cumInflation.flatMap { (value: CumInflation) -> ResultMap in value.resultMap }, "combinedInflations": combinedInflations.flatMap { (value: CombinedInflation) -> ResultMap in value.resultMap }, "gMeanInflation": gMeanInflation.flatMap { (value: GMeanInflation) -> ResultMap in value.resultMap }, "realCumulativeReturn": realCumulativeReturn.flatMap { (value: RealCumulativeReturn) -> ResultMap in value.resultMap }, "realCAGR": realCagr.flatMap { (value: [RealCagr?]) -> [ResultMap?] in value.map { (value: RealCagr?) -> ResultMap? in value.flatMap { (value: RealCagr) -> ResultMap in value.resultMap } } }, "assets": assets.flatMap { (value: [Asset?]) -> [ResultMap?] in value.map { (value: Asset?) -> ResultMap? in value.flatMap { (value: Asset) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var balance: Balance? {
        get {
          return (resultMap["balance"] as? ResultMap).flatMap { Balance(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "balance")
        }
      }

      public var cumulativeReturn: CumulativeReturn? {
        get {
          return (resultMap["cumulativeReturn"] as? ResultMap).flatMap { CumulativeReturn(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "cumulativeReturn")
        }
      }

      public var combinedCumulativeReturns: CombinedCumulativeReturn? {
        get {
          return (resultMap["combinedCumulativeReturns"] as? ResultMap).flatMap { CombinedCumulativeReturn(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "combinedCumulativeReturns")
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

      public var annualReturns: AnnualReturn? {
        get {
          return (resultMap["annualReturns"] as? ResultMap).flatMap { AnnualReturn(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "annualReturns")
        }
      }

      public var cagrs: [Cagr?]? {
        get {
          return (resultMap["cagrs"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Cagr?] in value.map { (value: ResultMap?) -> Cagr? in value.flatMap { (value: ResultMap) -> Cagr in Cagr(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Cagr?]) -> [ResultMap?] in value.map { (value: Cagr?) -> ResultMap? in value.flatMap { (value: Cagr) -> ResultMap in value.resultMap } } }, forKey: "cagrs")
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

      public var cumInflation: CumInflation? {
        get {
          return (resultMap["cumInflation"] as? ResultMap).flatMap { CumInflation(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "cumInflation")
        }
      }

      public var combinedInflations: CombinedInflation? {
        get {
          return (resultMap["combinedInflations"] as? ResultMap).flatMap { CombinedInflation(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "combinedInflations")
        }
      }

      public var gMeanInflation: GMeanInflation? {
        get {
          return (resultMap["gMeanInflation"] as? ResultMap).flatMap { GMeanInflation(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "gMeanInflation")
        }
      }

      public var realCumulativeReturn: RealCumulativeReturn? {
        get {
          return (resultMap["realCumulativeReturn"] as? ResultMap).flatMap { RealCumulativeReturn(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "realCumulativeReturn")
        }
      }

      public var realCagr: [RealCagr?]? {
        get {
          return (resultMap["realCAGR"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RealCagr?] in value.map { (value: ResultMap?) -> RealCagr? in value.flatMap { (value: ResultMap) -> RealCagr in RealCagr(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [RealCagr?]) -> [ResultMap?] in value.map { (value: RealCagr?) -> ResultMap? in value.flatMap { (value: RealCagr) -> ResultMap in value.resultMap } } }, forKey: "realCAGR")
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

      public struct PeriodDuration: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PeriodDuration"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("years", type: .nonNull(.scalar(Int.self))),
            GraphQLField("months", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(years: Int, months: Int) {
          self.init(unsafeResultMap: ["__typename": "PeriodDuration", "years": years, "months": months])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var years: Int {
          get {
            return resultMap["years"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "years")
          }
        }

        public var months: Int {
          get {
            return resultMap["months"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "months")
          }
        }
      }

      public struct Balance: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Balance"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("return_values", type: .object(ReturnValue.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(returnValues: ReturnValue? = nil) {
          self.init(unsafeResultMap: ["__typename": "Balance", "return_values": returnValues.flatMap { (value: ReturnValue) -> ResultMap in value.resultMap }])
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

        public struct ReturnValue: GraphQLSelectionSet {
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

      public struct CumulativeReturn: GraphQLSelectionSet {
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

      public struct CombinedCumulativeReturn: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TimeSeries"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("combined", type: .list(.object(Combined.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(combined: [Combined?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "TimeSeries", "combined": combined.flatMap { (value: [Combined?]) -> [ResultMap?] in value.map { (value: Combined?) -> ResultMap? in value.flatMap { (value: Combined) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var combined: [Combined?]? {
          get {
            return (resultMap["combined"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Combined?] in value.map { (value: ResultMap?) -> Combined? in value.flatMap { (value: ResultMap) -> Combined in Combined(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Combined?]) -> [ResultMap?] in value.map { (value: Combined?) -> ResultMap? in value.flatMap { (value: Combined) -> ResultMap in value.resultMap } } }, forKey: "combined")
          }
        }

        public struct Combined: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TimeSeriesValue"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("period", type: .scalar(String.self)),
              GraphQLField("value", type: .scalar(Double.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(period: String? = nil, value: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "TimeSeriesValue", "period": period, "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var period: String? {
            get {
              return resultMap["period"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "period")
            }
          }

          public var value: Double? {
            get {
              return resultMap["value"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
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

      public struct AnnualReturn: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TimeSeries"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("combined", type: .list(.object(Combined.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(combined: [Combined?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "TimeSeries", "combined": combined.flatMap { (value: [Combined?]) -> [ResultMap?] in value.map { (value: Combined?) -> ResultMap? in value.flatMap { (value: Combined) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var combined: [Combined?]? {
          get {
            return (resultMap["combined"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Combined?] in value.map { (value: ResultMap?) -> Combined? in value.flatMap { (value: ResultMap) -> Combined in Combined(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Combined?]) -> [ResultMap?] in value.map { (value: Combined?) -> ResultMap? in value.flatMap { (value: Combined) -> ResultMap in value.resultMap } } }, forKey: "combined")
          }
        }

        public struct Combined: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TimeSeriesValue"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("period", type: .scalar(String.self)),
              GraphQLField("value", type: .scalar(Double.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(period: String? = nil, value: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "TimeSeriesValue", "period": period, "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var period: String? {
            get {
              return resultMap["period"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "period")
            }
          }

          public var value: Double? {
            get {
              return resultMap["value"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }
      }

      public struct Cagr: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CagrPerYear"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("years_ago", type: .scalar(Int.self)),
            GraphQLField("value", type: .scalar(Double.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(yearsAgo: Int? = nil, value: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "CagrPerYear", "years_ago": yearsAgo, "value": value])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var yearsAgo: Int? {
          get {
            return resultMap["years_ago"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "years_ago")
          }
        }

        public var value: Double? {
          get {
            return resultMap["value"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }
      }

      public struct CumInflation: GraphQLSelectionSet {
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

      public struct CombinedInflation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TimeSeries"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("combined", type: .list(.object(Combined.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(combined: [Combined?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "TimeSeries", "combined": combined.flatMap { (value: [Combined?]) -> [ResultMap?] in value.map { (value: Combined?) -> ResultMap? in value.flatMap { (value: Combined) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var combined: [Combined?]? {
          get {
            return (resultMap["combined"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Combined?] in value.map { (value: ResultMap?) -> Combined? in value.flatMap { (value: ResultMap) -> Combined in Combined(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Combined?]) -> [ResultMap?] in value.map { (value: Combined?) -> ResultMap? in value.flatMap { (value: Combined) -> ResultMap in value.resultMap } } }, forKey: "combined")
          }
        }

        public struct Combined: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TimeSeriesValue"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("period", type: .scalar(String.self)),
              GraphQLField("value", type: .scalar(Double.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(period: String? = nil, value: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "TimeSeriesValue", "period": period, "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var period: String? {
            get {
              return resultMap["period"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "period")
            }
          }

          public var value: Double? {
            get {
              return resultMap["value"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }
      }

      public struct GMeanInflation: GraphQLSelectionSet {
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

      public struct RealCumulativeReturn: GraphQLSelectionSet {
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

      public struct RealCagr: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CagrPerYear"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(Double.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(value: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "CagrPerYear", "value": value])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var value: Double? {
          get {
            return resultMap["value"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }
      }

      public struct Asset: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PortfolioAssetWeighted"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("weight", type: .scalar(Double.self)),
            GraphQLField("asset", type: .object(Asset.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(weight: Double? = nil, asset: Asset? = nil) {
          self.init(unsafeResultMap: ["__typename": "PortfolioAssetWeighted", "weight": weight, "asset": asset.flatMap { (value: Asset) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var asset: Asset? {
          get {
            return (resultMap["asset"] as? ResultMap).flatMap { Asset(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "asset")
          }
        }

        public struct Asset: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PortfolioAsset"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("identifier", type: .object(Identifier.selections)),
              GraphQLField("short_name", type: .scalar(String.self)),
              GraphQLField("long_name", type: .scalar(String.self)),
              GraphQLField("initial_amount", type: .scalar(Double.self)),
              GraphQLField("currency_info", alias: "currency", type: .object(Currency.selections)),
              GraphQLField("period_duration", type: .object(PeriodDuration.selections)),
              GraphQLField("balance", arguments: ["initial_amount": GraphQLVariable("initialAmount")], type: .object(Balance.selections)),
              GraphQLField("return_values", alias: "cumulativeReturn", arguments: ["kind": "cumulative"], type: .object(CumulativeReturn.selections)),
              GraphQLField("return_values", alias: "ytdReturn", arguments: ["kind": "year_to_date"], type: .object(YtdReturn.selections)),
              GraphQLField("cagrs", type: .list(.object(Cagr.selections))),
              GraphQLField("risk", alias: "yearlyRisk", arguments: ["period": "yearly"], type: .scalar(Double.self)),
              GraphQLField("inflation", alias: "cumInflation", arguments: ["kind": "cumulative"], type: .object(CumInflation.selections)),
              GraphQLField("inflation", alias: "gMeanInflation", arguments: ["kind": "g_mean"], type: .object(GMeanInflation.selections)),
              GraphQLField("return_values", alias: "realCumulativeReturn", arguments: ["kind": "cumulative", "real": true], type: .object(RealCumulativeReturn.selections)),
              GraphQLField("cagrs", alias: "realCAGR", arguments: ["years_ago": 200, "real": true], type: .list(.object(RealCagr.selections))),
              GraphQLField("return_values", alias: "combinedCumulativeReturns", arguments: ["kind": "cumulative"], type: .object(CombinedCumulativeReturn.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(identifier: Identifier? = nil, shortName: String? = nil, longName: String? = nil, initialAmount: Double? = nil, currency: Currency? = nil, periodDuration: PeriodDuration? = nil, balance: Balance? = nil, cumulativeReturn: CumulativeReturn? = nil, ytdReturn: YtdReturn? = nil, cagrs: [Cagr?]? = nil, yearlyRisk: Double? = nil, cumInflation: CumInflation? = nil, gMeanInflation: GMeanInflation? = nil, realCumulativeReturn: RealCumulativeReturn? = nil, realCagr: [RealCagr?]? = nil, combinedCumulativeReturns: CombinedCumulativeReturn? = nil) {
            self.init(unsafeResultMap: ["__typename": "PortfolioAsset", "identifier": identifier.flatMap { (value: Identifier) -> ResultMap in value.resultMap }, "short_name": shortName, "long_name": longName, "initial_amount": initialAmount, "currency": currency.flatMap { (value: Currency) -> ResultMap in value.resultMap }, "period_duration": periodDuration.flatMap { (value: PeriodDuration) -> ResultMap in value.resultMap }, "balance": balance.flatMap { (value: Balance) -> ResultMap in value.resultMap }, "cumulativeReturn": cumulativeReturn.flatMap { (value: CumulativeReturn) -> ResultMap in value.resultMap }, "ytdReturn": ytdReturn.flatMap { (value: YtdReturn) -> ResultMap in value.resultMap }, "cagrs": cagrs.flatMap { (value: [Cagr?]) -> [ResultMap?] in value.map { (value: Cagr?) -> ResultMap? in value.flatMap { (value: Cagr) -> ResultMap in value.resultMap } } }, "yearlyRisk": yearlyRisk, "cumInflation": cumInflation.flatMap { (value: CumInflation) -> ResultMap in value.resultMap }, "gMeanInflation": gMeanInflation.flatMap { (value: GMeanInflation) -> ResultMap in value.resultMap }, "realCumulativeReturn": realCumulativeReturn.flatMap { (value: RealCumulativeReturn) -> ResultMap in value.resultMap }, "realCAGR": realCagr.flatMap { (value: [RealCagr?]) -> [ResultMap?] in value.map { (value: RealCagr?) -> ResultMap? in value.flatMap { (value: RealCagr) -> ResultMap in value.resultMap } } }, "combinedCumulativeReturns": combinedCumulativeReturns.flatMap { (value: CombinedCumulativeReturn) -> ResultMap in value.resultMap }])
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

          public var longName: String? {
            get {
              return resultMap["long_name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "long_name")
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

          public var currency: Currency? {
            get {
              return (resultMap["currency"] as? ResultMap).flatMap { Currency(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "currency")
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

          public var balance: Balance? {
            get {
              return (resultMap["balance"] as? ResultMap).flatMap { Balance(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "balance")
            }
          }

          public var cumulativeReturn: CumulativeReturn? {
            get {
              return (resultMap["cumulativeReturn"] as? ResultMap).flatMap { CumulativeReturn(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "cumulativeReturn")
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

          public var cagrs: [Cagr?]? {
            get {
              return (resultMap["cagrs"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Cagr?] in value.map { (value: ResultMap?) -> Cagr? in value.flatMap { (value: ResultMap) -> Cagr in Cagr(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Cagr?]) -> [ResultMap?] in value.map { (value: Cagr?) -> ResultMap? in value.flatMap { (value: Cagr) -> ResultMap in value.resultMap } } }, forKey: "cagrs")
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

          public var cumInflation: CumInflation? {
            get {
              return (resultMap["cumInflation"] as? ResultMap).flatMap { CumInflation(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "cumInflation")
            }
          }

          public var gMeanInflation: GMeanInflation? {
            get {
              return (resultMap["gMeanInflation"] as? ResultMap).flatMap { GMeanInflation(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "gMeanInflation")
            }
          }

          public var realCumulativeReturn: RealCumulativeReturn? {
            get {
              return (resultMap["realCumulativeReturn"] as? ResultMap).flatMap { RealCumulativeReturn(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "realCumulativeReturn")
            }
          }

          public var realCagr: [RealCagr?]? {
            get {
              return (resultMap["realCAGR"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RealCagr?] in value.map { (value: ResultMap?) -> RealCagr? in value.flatMap { (value: ResultMap) -> RealCagr in RealCagr(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [RealCagr?]) -> [ResultMap?] in value.map { (value: RealCagr?) -> ResultMap? in value.flatMap { (value: RealCagr) -> ResultMap in value.resultMap } } }, forKey: "realCAGR")
            }
          }

          public var combinedCumulativeReturns: CombinedCumulativeReturn? {
            get {
              return (resultMap["combinedCumulativeReturns"] as? ResultMap).flatMap { CombinedCumulativeReturn(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "combinedCumulativeReturns")
            }
          }

          public struct Identifier: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["FinancialSymbolId"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("full", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(full: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "FinancialSymbolId", "full": full])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

          public struct Currency: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["CurrencyInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("selected", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(selected: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "CurrencyInfo", "selected": selected])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var selected: String? {
              get {
                return resultMap["selected"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "selected")
              }
            }
          }

          public struct PeriodDuration: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PeriodDuration"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("years", type: .nonNull(.scalar(Int.self))),
                GraphQLField("months", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(years: Int, months: Int) {
              self.init(unsafeResultMap: ["__typename": "PeriodDuration", "years": years, "months": months])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var years: Int {
              get {
                return resultMap["years"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "years")
              }
            }

            public var months: Int {
              get {
                return resultMap["months"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "months")
              }
            }
          }

          public struct Balance: GraphQLSelectionSet {
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

          public struct CumulativeReturn: GraphQLSelectionSet {
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

          public struct Cagr: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["CagrPerYear"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("years_ago", type: .scalar(Int.self)),
                GraphQLField("value", type: .scalar(Double.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(yearsAgo: Int? = nil, value: Double? = nil) {
              self.init(unsafeResultMap: ["__typename": "CagrPerYear", "years_ago": yearsAgo, "value": value])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var yearsAgo: Int? {
              get {
                return resultMap["years_ago"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "years_ago")
              }
            }

            public var value: Double? {
              get {
                return resultMap["value"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }
          }

          public struct CumInflation: GraphQLSelectionSet {
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

          public struct GMeanInflation: GraphQLSelectionSet {
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

          public struct RealCumulativeReturn: GraphQLSelectionSet {
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

          public struct RealCagr: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["CagrPerYear"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("value", type: .scalar(Double.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(value: Double? = nil) {
              self.init(unsafeResultMap: ["__typename": "CagrPerYear", "value": value])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var value: Double? {
              get {
                return resultMap["value"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }
          }

          public struct CombinedCumulativeReturn: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["TimeSeries"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("combined", type: .list(.object(Combined.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(combined: [Combined?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "TimeSeries", "combined": combined.flatMap { (value: [Combined?]) -> [ResultMap?] in value.map { (value: Combined?) -> ResultMap? in value.flatMap { (value: Combined) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var combined: [Combined?]? {
              get {
                return (resultMap["combined"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Combined?] in value.map { (value: ResultMap?) -> Combined? in value.flatMap { (value: ResultMap) -> Combined in Combined(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Combined?]) -> [ResultMap?] in value.map { (value: Combined?) -> ResultMap? in value.flatMap { (value: Combined) -> ResultMap in value.resultMap } } }, forKey: "combined")
              }
            }

            public struct Combined: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["TimeSeriesValue"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("period", type: .scalar(String.self)),
                  GraphQLField("value", type: .scalar(Double.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(period: String? = nil, value: Double? = nil) {
                self.init(unsafeResultMap: ["__typename": "TimeSeriesValue", "period": period, "value": value])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var period: String? {
                get {
                  return resultMap["period"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "period")
                }
              }

              public var value: Double? {
                get {
                  return resultMap["value"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "value")
                }
              }
            }
          }
        }
      }
    }
  }
}
