# CodableMapper

CodableMapper is a framework written in Swift that makes it easy for you to convert  your decodable model objects (classes and structs) from JSON.
Inspired by ObjectMapper.

## Features

- Mapping JSON to decodable objects
- Nested Objects
- Custom transformations during mapping
- Struct support

## Usage

basic and transform

```
{
    "id": 100,
    "date": "2015/03/04 12:34:56 +09:00"
}
```

```
struct Content: Decodable {
  var id: Int = 0
  var date: Date?
  
  public init(from decoder: Decoder) throws {
    id <- decoder["id"]
    date <- (decoder["date"], DateTransform())
  }
}
```

```
let content = Content(JSONString: json)!
```

## Nested value

nested json to flat.

```
{
    "user": {
        "id": 100
    }
}
```

```
struct User: Decodable {
  var id: Int = 0
  
  public init(from decoder: Decoder) throws {
    id <- decoder["user.id"]
  }
}
```

## Example

look to tests.

## Requirements

Swift 4.0

## Installation

CodableMapper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CodableMapper'
```

carthage

```
github 'noppefoxwolf/CodableMapper'
```

## Author

Tomoya Hirano, noppelabs@gmail.com

## License

CodableMapper is available under the MIT license. See the LICENSE file for more info.
