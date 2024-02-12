//
//  Dishwashers.swift
//  JohnLewis
//
//  Created by hanif hussain on 12/02/2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.


import Foundation

// MARK: - Dishwashers
struct Dishwashers: Codable {
    let showInStockOnly: Bool
    let products: [Product]
    let facets: [Facet]
    let results, pagesAvailable: Int
    let crumbs: [Crumb]
    let dynamicBannerID: String
    let banners: Banners
    let categoryTitle, seoBannerID: String
    let seoInformation: SEOInformation
    let pageInformation: PageInformation
    let triggeredRules: TriggeredRules
    let endecaCanonical, baseFacetID: String

    enum CodingKeys: String, CodingKey {
        case showInStockOnly, products, facets, results, pagesAvailable, crumbs
        case dynamicBannerID = "dynamicBannerId"
        case banners, categoryTitle
        case seoBannerID = "seoBannerId"
        case seoInformation, pageInformation, triggeredRules, endecaCanonical
        case baseFacetID = "baseFacetId"
    }
}

// MARK: - Banners
struct Banners: Codable {
    let topBannerID, blockBannerID, seoBannerID: String

    enum CodingKeys: String, CodingKey {
        case topBannerID = "topBannerId"
        case blockBannerID = "blockBannerId"
        case seoBannerID = "seoBannerId"
    }
}

// MARK: - Crumb
struct Crumb: Codable {
    let url, clickable, displayName, type: String
    let item: String
}

// MARK: - Facet
struct Facet: Codable {
    let dimensionName, name: String
    let type: FacetType
    let tooltip: String
    let filterTypes: [FilterType]
    let details: [Detail]
}

// MARK: - Detail
struct Detail: Codable {
    let facetID, label, qty, color: String
    let colorSwatchURL, isSelected: String

    enum CodingKeys: String, CodingKey {
        case facetID = "facetId"
        case label, qty, color
        case colorSwatchURL = "colorSwatchUrl"
        case isSelected
    }
}

enum FilterType: String, Codable {
    case aboveSEO = "AboveSeo"
    case alwaysShow = "AlwaysShow"
    case filterTypeDynamic = "Dynamic"
    case seo = "Seo"
}

enum FacetType: String, Codable {
    case single = "Single"
}

// MARK: - PageInformation
struct PageInformation: Codable {
    let title, heading, description: String
    let noIndex, noFollow: Bool
}

// MARK: - Product
struct Product: Codable {
    let productID: String
    let type: ProductType
    let title, htmlTitle, code: String
    let averageRating: Double
    let reviews: Int
    let price: Price
    let image: String
    let alternativeImageUrls: [String]
    let displaySpecialOffer: DisplaySpecialOffer
    let promoMessages: PromoMessages
    let nonPromoMessage, defaultSkuID: String
    let colorSwatches: [ColorSwatch]
    let colorSwatchSelected: Int
    let colorWheelMessage: String
    let outOfStock, emailMeWhenAvailable: Bool
    let availabilityMessage: String
    let compare: Bool
    let fabric: String
    let swatchAvailable, categoryQuickViewEnabled: Bool
    let swatchCategoryType, brand: String
    let ageRestriction: Int
    let isInStoreOnly, isMadeToMeasure, isBundle, isProductSet: Bool
    let promotionalFeatures, features: [JSONAny]
    let dynamicAttributes: [String: String]
    let directorate: Directorate
    let futureRelease, multiSku, fabricByLength: Bool
    let messaging: [Messaging]
    let quickAddToBasket: QuickAddToBasket
    let permanentOos: Bool

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case type, title, htmlTitle, code, averageRating, reviews, price, image, alternativeImageUrls, displaySpecialOffer, promoMessages, nonPromoMessage
        case defaultSkuID = "defaultSkuId"
        case colorSwatches, colorSwatchSelected, colorWheelMessage, outOfStock, emailMeWhenAvailable, availabilityMessage, compare, fabric, swatchAvailable, categoryQuickViewEnabled, swatchCategoryType, brand, ageRestriction, isInStoreOnly, isMadeToMeasure, isBundle, isProductSet, promotionalFeatures, features, dynamicAttributes, directorate, futureRelease, multiSku, fabricByLength, messaging, quickAddToBasket, permanentOos
    }
}

// MARK: - ColorSwatch
struct ColorSwatch: Codable {
    let color: String
    let basicColor: BasicColor
    let colorSwatchURL, imageURL: String
    let isAvailable: Bool
    let skuID: String

    enum CodingKeys: String, CodingKey {
        case color, basicColor
        case colorSwatchURL = "colorSwatchUrl"
        case imageURL = "imageUrl"
        case isAvailable
        case skuID = "skuId"
    }
}

enum BasicColor: String, Codable {
    case empty = ""
    case grey = "Grey"
    case silver = "Silver"
    case white = "White"
}

enum Directorate: String, Codable {
    case technologyDirectora = "Technology Directora"
}

enum DisplaySpecialOffer: String, Codable {
    case claimAnAdditional3YearGuaranteeAtNoExtraCost = "Claim an additional 3 year guarantee at no extra cost"
    case empty = ""
}

// MARK: - Messaging
struct Messaging: Codable {
    let title, type: String
}

// MARK: - Price
struct Price: Codable {
    let was, then1, then2, now: String
    let uom: String
    let currency: Currency
}

enum Currency: String, Codable {
    case gbp = "GBP"
}

// MARK: - PromoMessages
struct PromoMessages: Codable {
    let reducedToClear: Bool
    let priceMatched, offer, customPromotionalMessage, bundleHeadline: String
    let customSpecialOffer: CustomSpecialOffer
}

// MARK: - CustomSpecialOffer
struct CustomSpecialOffer: Codable {
    let customSpecialOfferID, imageURL, linkText, linkURL: String?
    let longDescription, promoImageName: String?
    let siteDisplayName: DisplaySpecialOffer?

    enum CodingKeys: String, CodingKey {
        case customSpecialOfferID = "customSpecialOfferId"
        case imageURL, linkText, linkURL, longDescription, promoImageName, siteDisplayName
    }
}

// MARK: - QuickAddToBasket
struct QuickAddToBasket: Codable {
    let showPermanentOos, showMoreInfoRedirectPDP, simpleAddToBasket, simpleMobileEmailMe: Bool
    let showEmailMeTriggerQV, showChooseSizeTriggerQV: Bool
}

enum ProductType: String, Codable {
    case product = "product"
}

// MARK: - SEOInformation
struct SEOInformation: Codable {
    let description: String
    let noIndex: Bool
}

// MARK: - TriggeredRules
struct TriggeredRules: Codable {
    let triggeredRulesDynamic, seo: String

    enum CodingKeys: String, CodingKey {
        case triggeredRulesDynamic = "dynamic"
        case seo
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
