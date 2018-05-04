

import Foundation

struct ApixuWeatherContainer: Codable {
    var current: ApixuWeatherCurrent
}

struct ApixuWeatherCurrent: Codable {
    var temp_c: Float
    var temp_f: Float
    var condition: ApixuWeatherCondition
}

struct ApixuWeatherCondition: Codable {
    var text: String
    var icon: String // icon image url
}
