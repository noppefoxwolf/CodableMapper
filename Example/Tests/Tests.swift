// https://github.com/Quick/Quick

import Quick
import Nimble
import CodableMapper

class CodableMapperSpec: QuickSpec {
  override func spec() {
    describe("mapping") {
      context("json", {
        let json = """
                {"codableStringValue":"_codableValue_","codableIntValue":10,"camel_value":"_camel_value_","items":[1,2,3,4], "nested":{"id":1000,"nested":{"id":2000}}, "date":"2015/03/04 12:34:56 +09:00"}
                """
        it("mapped structure", closure: {
          let sample = SampleStruct(JSONString: json)!
          expect(sample.codableStringValue).to(equal("_codableValue_"))
          expect(sample.noExistsCodableValue).to(equal("default"))
          expect(sample.codableIntValue).to(equal(10))
          expect(sample.camelValue).to(equal("_camel_value_"))
          expect(sample.items).to(equal([1,2,3,4]))
          expect(sample.nested?.id).to(equal(1000))
          expect(sample.nestedId).to(equal(1000))
          expect(sample.doubleNestedId).to(equal(2000))
          
          let formatter = DateFormatter()
          formatter.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
          formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
          expect(sample.date.timeIntervalSince1970).to(equal(formatter.date(from: "2015/03/04 12:34:56 +09:00")?.timeIntervalSince1970))
        })
        it("mapped class", closure: {
          let sample = SampleClass(JSONString: json)!
          expect(sample.codableStringValue).to(equal("_codableValue_"))
          expect(sample.noExistsCodableValue).to(equal("default"))
          expect(sample.codableIntValue).to(equal(10))
          expect(sample.camelValue).to(equal("_camel_value_"))
          expect(sample.items).to(equal([1,2,3,4]))
          expect(sample.nested?.id).to(equal(1000))
          expect(sample.nestedId).to(equal(1000))
          expect(sample.doubleNestedId).to(equal(2000))
          
          let formatter = DateFormatter()
          formatter.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
          formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
          expect(sample.date.timeIntervalSince1970).to(equal(formatter.date(from: "2015/03/04 12:34:56 +09:00")?.timeIntervalSince1970))
        })
      })
    }
  }
}

class SampleClass: Decodable {
  var codableStringValue: String = "default"
  var noExistsCodableValue: String = "default"
  var codableIntValue: Int = 0
  var camelValue: String = "default"
  var items: [Int] = []
  var image: UIImage? = nil
  var nested: Nest? = nil
  var nestedId: Int = 0
  var doubleNestedId: Int = 0
  var date: Date = Date()
  
  public required init(from decoder: Decoder) throws {
    codableStringValue <- decoder["codableStringValue"]
    noExistsCodableValue <- decoder["noExistsCodableValue"]
    codableIntValue <- decoder["codableIntValue"]
    camelValue <- decoder["camel_value"]
    items <- decoder["items"]
    nested <- decoder["nested"]
    nestedId <- decoder["nested.id"]
    doubleNestedId <- decoder["nested.nested.id"]
    date <- (decoder["date"], DateTransform())
  }
}

struct SampleStruct: Decodable {
  var codableStringValue: String = "default"
  var noExistsCodableValue: String = "default"
  var codableIntValue: Int = 0
  var camelValue: String = "default"
  var items: [Int] = []
  var image: UIImage? = nil
  var nested: Nest? = nil
  var nestedId: Int = 0
  var doubleNestedId: Int = 0
  var date: Date = Date()
  
  public init(from decoder: Decoder) throws {
    codableStringValue <- decoder["codableStringValue"]
    noExistsCodableValue <- decoder["noExistsCodableValue"]
    codableIntValue <- decoder["codableIntValue"]
    camelValue <- decoder["camel_value"]
    items <- decoder["items"]
    nested <- decoder["nested"]
    nestedId <- decoder["nested.id"]
    doubleNestedId <- decoder["nested.nested.id"]
    date <- (decoder["date"], DateTransform())
  }
}

struct Nest: Decodable {
  var id: Int = 0
  public init(from decoder: Decoder) throws {
    id <- decoder["id"]
  }
}

