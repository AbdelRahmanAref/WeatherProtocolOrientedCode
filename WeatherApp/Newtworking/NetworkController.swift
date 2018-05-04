import Foundation

protocol NetworkController {
    //completion handler is non-escaping by default which means the completion is invoked before the return, but here we want the return first of the fetchCurrentWeatherData before the network call complete then the completion
    func fetchCurrentWeatherData(city: String, completionHandler: @escaping (WeatherData?, NetworkControllerError?) -> Void)
}

public struct WeatherData {
    var temperature: Float
    var condition: String
    var unit: TemperatureUnit
}

public enum TemperatureUnit: String {
    case scientific = "K"
    case metric = "C"
    case imperial = "F"
}

//good habit to create specific error "provide meaningful information" that are specific to a given context and enumeration are well suited to create simple error type - conform to Error protocol. Error protocol doesn't require specific requirement
public enum NetworkControllerError: Error {
    case invalidURL(String) // and associated parameters to be send
    case invalidPayload(URL) //return contnet like the return is xml not json
    case forwarded(Error) // for everything else
}
