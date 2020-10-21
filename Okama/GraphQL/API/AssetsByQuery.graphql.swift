// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AssetsByQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AssetsByQuery($query: String!) {
      assets_by_query(queries: [$query]) {
        __typename
        symbols {
          __typename
          identifier {
            __typename
            full
          }
          title
          exchange
        }
      }
    }
    """

  public let operationName: String = "AssetsByQuery"

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("assets_by_query", arguments: ["queries": [GraphQLVariable("query")]], type: .list(.object(AssetsByQuery.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(assetsByQuery: [AssetsByQuery?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "assets_by_query": assetsByQuery.flatMap { (value: [AssetsByQuery?]) -> [ResultMap?] in value.map { (value: AssetsByQuery?) -> ResultMap? in value.flatMap { (value: AssetsByQuery) -> ResultMap in value.resultMap } } }])
    }

    public var assetsByQuery: [AssetsByQuery?]? {
      get {
        return (resultMap["assets_by_query"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AssetsByQuery?] in value.map { (value: ResultMap?) -> AssetsByQuery? in value.flatMap { (value: ResultMap) -> AssetsByQuery in AssetsByQuery(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AssetsByQuery?]) -> [ResultMap?] in value.map { (value: AssetsByQuery?) -> ResultMap? in value.flatMap { (value: AssetsByQuery) -> ResultMap in value.resultMap } } }, forKey: "assets_by_query")
      }
    }

    public struct AssetsByQuery: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Result"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("symbols", type: .list(.object(Symbol.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(symbols: [Symbol?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Result", "symbols": symbols.flatMap { (value: [Symbol?]) -> [ResultMap?] in value.map { (value: Symbol?) -> ResultMap? in value.flatMap { (value: Symbol) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var symbols: [Symbol?]? {
        get {
          return (resultMap["symbols"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Symbol?] in value.map { (value: ResultMap?) -> Symbol? in value.flatMap { (value: ResultMap) -> Symbol in Symbol(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Symbol?]) -> [ResultMap?] in value.map { (value: Symbol?) -> ResultMap? in value.flatMap { (value: Symbol) -> ResultMap in value.resultMap } } }, forKey: "symbols")
        }
      }

      public struct Symbol: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FinancialSymbol"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("identifier", type: .object(Identifier.selections)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("exchange", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(identifier: Identifier? = nil, title: String? = nil, exchange: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FinancialSymbol", "identifier": identifier.flatMap { (value: Identifier) -> ResultMap in value.resultMap }, "title": title, "exchange": exchange])
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

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var exchange: String? {
          get {
            return resultMap["exchange"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "exchange")
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
      }
    }
  }
}
