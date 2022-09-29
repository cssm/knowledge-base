 ```swift
import Foundation

// To get any JSON
let jsonResponse = try JSONSerialization.jsonObject(
	with: dataResponse, options: []
) 
guard let jsonArray = jsonResponse as? [[String: Any]] else { return }
print(jsonArray)
```
```swift
// we can add CodingKeys enum to encode and decode ony some fileds
struct SomeCodable: Codable {
	private let c: [Int] // not encoded by default
	let a: String
	let b: Int
}

// now only `a` property will be encoded
extension SomeCodable {
	enum CodingKeys: CodingKey {
		case a	
	}
}
```

- Example of decoding with `CodingKey` as `struct`
```swift
let raw = """
{
  "points": ["KSQL", "KWVI"],
  "KSQL": {
    "code": "KSQL",
    "name": "San Carlos Airport"
  },
  "KWVI": {
    "code": "KWVI",
    "name": "Watsonville Municipal Airport"
  }
}
""".data(using: .ascii)!

struct Route: Decodable {
    struct Airport: Decodable {
        var code: String
        var name: String
    }
    
    let points: [Airport]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.points = try container.decode([String].self, forKey: .points)
            .compactMap(CodingKeys.init)
            .map { try container.decode(Airport.self, forKey: $0) }
    }
}

extension Route {
    private struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int? {
            return nil
        }
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        init?(intValue: Int) {
            return nil
        }
        static var points: Self { Self(stringValue: "points")! }
    }
}

let decoder = JSONDecoder()
let airports = try! decoder.decode(Route.self, from: raw)
dump(airports.points)
```