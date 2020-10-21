// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class InflationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Inflation($currency: Currency) {
      inflation(currency: $currency) {
        __typename
        currency
        months_12_sliding_window {
          __typename
          combined {
            __typename
            period
            value
          }
        }
        year_on_year {
          __typename
          combined {
            __typename
            period
            value
          }
        }
        values_by_year {
          __typename
          year
          values {
            __typename
            combined {
              __typename
              period
              value
            }
          }
          cumulative {
            __typename
            values
          }
        }
      }
    }
    """

  public let operationName: String = "Inflation"

  public var currency: Currency?

  public init(currency: Currency? = nil) {
    self.currency = currency
  }

  public var variables: GraphQLMap? {
    return ["currency": currency]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("inflation", arguments: ["currency": GraphQLVariable("currency")], type: .object(Inflation.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(inflation: Inflation? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "inflation": inflation.flatMap { (value: Inflation) -> ResultMap in value.resultMap }])
    }

    public var inflation: Inflation? {
      get {
        return (resultMap["inflation"] as? ResultMap).flatMap { Inflation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "inflation")
      }
    }

    public struct Inflation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Inflation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .scalar(Currency.self)),
          GraphQLField("months_12_sliding_window", type: .list(.object(Months_12SlidingWindow.selections))),
          GraphQLField("year_on_year", type: .object(YearOnYear.selections)),
          GraphQLField("values_by_year", type: .list(.object(ValuesByYear.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(currency: Currency? = nil, months_12SlidingWindow: [Months_12SlidingWindow?]? = nil, yearOnYear: YearOnYear? = nil, valuesByYear: [ValuesByYear?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Inflation", "currency": currency, "months_12_sliding_window": months_12SlidingWindow.flatMap { (value: [Months_12SlidingWindow?]) -> [ResultMap?] in value.map { (value: Months_12SlidingWindow?) -> ResultMap? in value.flatMap { (value: Months_12SlidingWindow) -> ResultMap in value.resultMap } } }, "year_on_year": yearOnYear.flatMap { (value: YearOnYear) -> ResultMap in value.resultMap }, "values_by_year": valuesByYear.flatMap { (value: [ValuesByYear?]) -> [ResultMap?] in value.map { (value: ValuesByYear?) -> ResultMap? in value.flatMap { (value: ValuesByYear) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var months_12SlidingWindow: [Months_12SlidingWindow?]? {
        get {
          return (resultMap["months_12_sliding_window"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Months_12SlidingWindow?] in value.map { (value: ResultMap?) -> Months_12SlidingWindow? in value.flatMap { (value: ResultMap) -> Months_12SlidingWindow in Months_12SlidingWindow(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Months_12SlidingWindow?]) -> [ResultMap?] in value.map { (value: Months_12SlidingWindow?) -> ResultMap? in value.flatMap { (value: Months_12SlidingWindow) -> ResultMap in value.resultMap } } }, forKey: "months_12_sliding_window")
        }
      }

      public var yearOnYear: YearOnYear? {
        get {
          return (resultMap["year_on_year"] as? ResultMap).flatMap { YearOnYear(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "year_on_year")
        }
      }

      public var valuesByYear: [ValuesByYear?]? {
        get {
          return (resultMap["values_by_year"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ValuesByYear?] in value.map { (value: ResultMap?) -> ValuesByYear? in value.flatMap { (value: ResultMap) -> ValuesByYear in ValuesByYear(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ValuesByYear?]) -> [ResultMap?] in value.map { (value: ValuesByYear?) -> ResultMap? in value.flatMap { (value: ValuesByYear) -> ResultMap in value.resultMap } } }, forKey: "values_by_year")
        }
      }

      public struct Months_12SlidingWindow: GraphQLSelectionSet {
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

      public struct YearOnYear: GraphQLSelectionSet {
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

      public struct ValuesByYear: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["InflationValuesPerYear"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("values", type: .object(Value.selections)),
            GraphQLField("cumulative", type: .object(Cumulative.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(year: Int? = nil, values: Value? = nil, cumulative: Cumulative? = nil) {
          self.init(unsafeResultMap: ["__typename": "InflationValuesPerYear", "year": year, "values": values.flatMap { (value: Value) -> ResultMap in value.resultMap }, "cumulative": cumulative.flatMap { (value: Cumulative) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        public var values: Value? {
          get {
            return (resultMap["values"] as? ResultMap).flatMap { Value(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "values")
          }
        }

        public var cumulative: Cumulative? {
          get {
            return (resultMap["cumulative"] as? ResultMap).flatMap { Cumulative(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "cumulative")
          }
        }

        public struct Value: GraphQLSelectionSet {
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

        public struct Cumulative: GraphQLSelectionSet {
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
