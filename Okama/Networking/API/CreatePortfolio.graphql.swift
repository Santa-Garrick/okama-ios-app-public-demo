// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CreatePortfolioMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreatePortfolio($assets: [PortfolioAssetWeightedInput]!, $currency: Currency!, $initialAmount: Float!, $period: PortfolioPeriod!) {
      create_portfolio(assets: $assets, currency: $currency, initial_amount: $initialAmount, period: $period) {
        __typename
        uuid
        ok
        errors
      }
    }
    """

  public let operationName: String = "CreatePortfolio"

  public var assets: [PortfolioAssetWeightedInput?]
  public var currency: Currency
  public var initialAmount: Double
  public var period: PortfolioPeriod

  public init(assets: [PortfolioAssetWeightedInput?], currency: Currency, initialAmount: Double, period: PortfolioPeriod) {
    self.assets = assets
    self.currency = currency
    self.initialAmount = initialAmount
    self.period = period
  }

  public var variables: GraphQLMap? {
    return ["assets": assets, "currency": currency, "initialAmount": initialAmount, "period": period]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutations"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("create_portfolio", arguments: ["assets": GraphQLVariable("assets"), "currency": GraphQLVariable("currency"), "initial_amount": GraphQLVariable("initialAmount"), "period": GraphQLVariable("period")], type: .object(CreatePortfolio.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPortfolio: CreatePortfolio? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "create_portfolio": createPortfolio.flatMap { (value: CreatePortfolio) -> ResultMap in value.resultMap }])
    }

    public var createPortfolio: CreatePortfolio? {
      get {
        return (resultMap["create_portfolio"] as? ResultMap).flatMap { CreatePortfolio(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "create_portfolio")
      }
    }

    public struct CreatePortfolio: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CreatePortfolio"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uuid", type: .scalar(String.self)),
          GraphQLField("ok", type: .scalar(Bool.self)),
          GraphQLField("errors", type: .list(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(uuid: String? = nil, ok: Bool? = nil, errors: [String?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CreatePortfolio", "uuid": uuid, "ok": ok, "errors": errors])
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

      public var ok: Bool? {
        get {
          return resultMap["ok"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var errors: [String?]? {
        get {
          return resultMap["errors"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "errors")
        }
      }
    }
  }
}

public final class UpdatePortfolioMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdatePortfolio($assets: [PortfolioAssetWeightedInput]!, $currency: Currency!, $initialAmount: Float!, $period: PortfolioPeriod!, $uuid: UUID!) {
      update_portfolio(assets: $assets, currency: $currency, initial_amount: $initialAmount, period: $period, uuid: $uuid) {
        __typename
        uuid
        ok
        errors
      }
    }
    """

  public let operationName: String = "UpdatePortfolio"

  public var assets: [PortfolioAssetWeightedInput?]
  public var currency: Currency
  public var initialAmount: Double
  public var period: PortfolioPeriod
  public var uuid: String

  public init(assets: [PortfolioAssetWeightedInput?], currency: Currency, initialAmount: Double, period: PortfolioPeriod, uuid: String) {
    self.assets = assets
    self.currency = currency
    self.initialAmount = initialAmount
    self.period = period
    self.uuid = uuid
  }

  public var variables: GraphQLMap? {
    return ["assets": assets, "currency": currency, "initialAmount": initialAmount, "period": period, "uuid": uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutations"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_portfolio", arguments: ["assets": GraphQLVariable("assets"), "currency": GraphQLVariable("currency"), "initial_amount": GraphQLVariable("initialAmount"), "period": GraphQLVariable("period"), "uuid": GraphQLVariable("uuid")], type: .object(UpdatePortfolio.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updatePortfolio: UpdatePortfolio? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "update_portfolio": updatePortfolio.flatMap { (value: UpdatePortfolio) -> ResultMap in value.resultMap }])
    }

    public var updatePortfolio: UpdatePortfolio? {
      get {
        return (resultMap["update_portfolio"] as? ResultMap).flatMap { UpdatePortfolio(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "update_portfolio")
      }
    }

    public struct UpdatePortfolio: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UpdatePortfolio"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uuid", type: .scalar(String.self)),
          GraphQLField("ok", type: .scalar(Bool.self)),
          GraphQLField("errors", type: .list(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(uuid: String? = nil, ok: Bool? = nil, errors: [String?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "UpdatePortfolio", "uuid": uuid, "ok": ok, "errors": errors])
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

      public var ok: Bool? {
        get {
          return resultMap["ok"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var errors: [String?]? {
        get {
          return resultMap["errors"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "errors")
        }
      }
    }
  }
}

public final class DeletePortfolioMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeletePortfolio($id: UUID!) {
      delete_portfolio(portfolio_ids: [$id]) {
        __typename
        ok
        errors
      }
    }
    """

  public let operationName: String = "DeletePortfolio"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutations"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("delete_portfolio", arguments: ["portfolio_ids": [GraphQLVariable("id")]], type: .object(DeletePortfolio.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deletePortfolio: DeletePortfolio? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "delete_portfolio": deletePortfolio.flatMap { (value: DeletePortfolio) -> ResultMap in value.resultMap }])
    }

    public var deletePortfolio: DeletePortfolio? {
      get {
        return (resultMap["delete_portfolio"] as? ResultMap).flatMap { DeletePortfolio(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete_portfolio")
      }
    }

    public struct DeletePortfolio: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DeletePortfolio"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .scalar(Bool.self)),
          GraphQLField("errors", type: .list(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool? = nil, errors: [String?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "DeletePortfolio", "ok": ok, "errors": errors])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool? {
        get {
          return resultMap["ok"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var errors: [String?]? {
        get {
          return resultMap["errors"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "errors")
        }
      }
    }
  }
}
