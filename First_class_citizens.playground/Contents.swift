//: Playground - First_class_citizens

import Foundation

protocol Parser {
    func parse(_ response: String) -> [String: AnyObject]
}

class JSONParser: Parser {
    func parse(_ response: String) -> [String : AnyObject] {
        let data = response.data(using: .utf8)!
        
        return try! JSONSerialization.jsonObject(with: data) as! [String: AnyObject]
    }
}

class XMLParser: Parser {
    func parse(_ response: String) -> [String : AnyObject] {
        return [:]
    }
}

class HTMLParser: Parser {
    func parse(_ response: String) -> [String : AnyObject] {
        return [:]
    }
}

func data(from url: URL, parser: Parser) -> [String: AnyObject] {
    
    let data = NSData(contentsOf: url)! as Data
    let content = String(data: data, encoding: .utf8)!
    
    return parser.parse(content)
}

let url = URL(string: "http://swiftfuncional.com/exercises/posts/1")!

data(from: url, parser: JSONParser())

