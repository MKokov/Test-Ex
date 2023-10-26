struct Age: Codable{
    var count: Int?
    var name: String?
    var age: Int?
}

struct Gender: Codable{
    var count: Int?
    var name: String?
    var gender: String?
    var probability: Double?
}

struct CountryContainer: Codable{
    var count: Int?
    var name: String?
    var country:[Country]?
}

struct Country: Codable{
    var country_id: String?
    var probability: Double?
}
