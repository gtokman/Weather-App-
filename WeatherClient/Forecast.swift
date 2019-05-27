// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let forecast = try Forecast(json)

import Foundation

// MARK: - Forecast
struct Forecast: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currently: Currently
    let minutely: Minutely
    let hourly: Hourly
    let daily: Daily
    let flags: Flags
    let offset: Int
}

// MARK: Forecast convenience initializers and mutators

extension Forecast {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Forecast.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        latitude: Double? = nil,
        longitude: Double? = nil,
        timezone: String? = nil,
        currently: Currently? = nil,
        minutely: Minutely? = nil,
        hourly: Hourly? = nil,
        daily: Daily? = nil,
        flags: Flags? = nil,
        offset: Int? = nil
    ) -> Forecast {
        return Forecast(
            latitude: latitude ?? self.latitude,
            longitude: longitude ?? self.longitude,
            timezone: timezone ?? self.timezone,
            currently: currently ?? self.currently,
            minutely: minutely ?? self.minutely,
            hourly: hourly ?? self.hourly,
            daily: daily ?? self.daily,
            flags: flags ?? self.flags,
            offset: offset ?? self.offset
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Currently
struct Currently: Codable {
    let time: Int
    let summary, icon: String
    let nearestStormDistance, nearestStormBearing: Int?
    let precipIntensity, precipProbability, temperature, apparentTemperature: Double
    let dewPoint, humidity, pressure, windSpeed: Double
    let windGust: Double
    let windBearing: Int
    let cloudCover: Double
    let uvIndex: Int
    let visibility, ozone: Double
    let precipType: String?
}

// MARK: Currently convenience initializers and mutators

extension Currently {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Currently.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        time: Int? = nil,
        summary: String? = nil,
        icon: String? = nil,
        nearestStormDistance: Int?? = nil,
        nearestStormBearing: Int?? = nil,
        precipIntensity: Double? = nil,
        precipProbability: Double? = nil,
        temperature: Double? = nil,
        apparentTemperature: Double? = nil,
        dewPoint: Double? = nil,
        humidity: Double? = nil,
        pressure: Double? = nil,
        windSpeed: Double? = nil,
        windGust: Double? = nil,
        windBearing: Int? = nil,
        cloudCover: Double? = nil,
        uvIndex: Int? = nil,
        visibility: Double? = nil,
        ozone: Double? = nil,
        precipType: String?? = nil
    ) -> Currently {
        return Currently(
            time: time ?? self.time,
            summary: summary ?? self.summary,
            icon: icon ?? self.icon,
            nearestStormDistance: nearestStormDistance ?? self.nearestStormDistance,
            nearestStormBearing: nearestStormBearing ?? self.nearestStormBearing,
            precipIntensity: precipIntensity ?? self.precipIntensity,
            precipProbability: precipProbability ?? self.precipProbability,
            temperature: temperature ?? self.temperature,
            apparentTemperature: apparentTemperature ?? self.apparentTemperature,
            dewPoint: dewPoint ?? self.dewPoint,
            humidity: humidity ?? self.humidity,
            pressure: pressure ?? self.pressure,
            windSpeed: windSpeed ?? self.windSpeed,
            windGust: windGust ?? self.windGust,
            windBearing: windBearing ?? self.windBearing,
            cloudCover: cloudCover ?? self.cloudCover,
            uvIndex: uvIndex ?? self.uvIndex,
            visibility: visibility ?? self.visibility,
            ozone: ozone ?? self.ozone,
            precipType: precipType ?? self.precipType
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Daily
struct Daily: Codable {
    let summary, icon: String
    let data: [DailyDatum]
}

// MARK: Daily convenience initializers and mutators

extension Daily {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Daily.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        summary: String? = nil,
        icon: String? = nil,
        data: [DailyDatum]? = nil
    ) -> Daily {
        return Daily(
            summary: summary ?? self.summary,
            icon: icon ?? self.icon,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int
    let summary, icon: String
    let sunriseTime, sunsetTime: Int
    let moonPhase, precipIntensity, precipIntensityMax: Double
    let precipIntensityMaxTime: Int
    let precipProbability: Double
    let precipType: String?
    let temperatureHigh: Double
    let temperatureHighTime: Int
    let temperatureLow: Double
    let temperatureLowTime: Int
    let apparentTemperatureHigh: Double
    let apparentTemperatureHighTime: Int
    let apparentTemperatureLow: Double
    let apparentTemperatureLowTime: Int
    let dewPoint, humidity, pressure, windSpeed: Double
    let windGust: Double
    let windGustTime, windBearing: Int
    let cloudCover: Double
    let uvIndex, uvIndexTime: Int
    let visibility, ozone, temperatureMin: Double
    let temperatureMinTime: Int
    let temperatureMax: Double
    let temperatureMaxTime: Int
    let apparentTemperatureMin: Double
    let apparentTemperatureMinTime: Int
    let apparentTemperatureMax: Double
    let apparentTemperatureMaxTime: Int
}

// MARK: DailyDatum convenience initializers and mutators

extension DailyDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DailyDatum.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        time: Int? = nil,
        summary: String? = nil,
        icon: String? = nil,
        sunriseTime: Int? = nil,
        sunsetTime: Int? = nil,
        moonPhase: Double? = nil,
        precipIntensity: Double? = nil,
        precipIntensityMax: Double? = nil,
        precipIntensityMaxTime: Int? = nil,
        precipProbability: Double? = nil,
        precipType: String? = nil,
        temperatureHigh: Double? = nil,
        temperatureHighTime: Int? = nil,
        temperatureLow: Double? = nil,
        temperatureLowTime: Int? = nil,
        apparentTemperatureHigh: Double? = nil,
        apparentTemperatureHighTime: Int? = nil,
        apparentTemperatureLow: Double? = nil,
        apparentTemperatureLowTime: Int? = nil,
        dewPoint: Double? = nil,
        humidity: Double? = nil,
        pressure: Double? = nil,
        windSpeed: Double? = nil,
        windGust: Double? = nil,
        windGustTime: Int? = nil,
        windBearing: Int? = nil,
        cloudCover: Double? = nil,
        uvIndex: Int? = nil,
        uvIndexTime: Int? = nil,
        visibility: Double? = nil,
        ozone: Double? = nil,
        temperatureMin: Double? = nil,
        temperatureMinTime: Int? = nil,
        temperatureMax: Double? = nil,
        temperatureMaxTime: Int? = nil,
        apparentTemperatureMin: Double? = nil,
        apparentTemperatureMinTime: Int? = nil,
        apparentTemperatureMax: Double? = nil,
        apparentTemperatureMaxTime: Int? = nil
    ) -> DailyDatum {
        return DailyDatum(
            time: time ?? self.time,
            summary: summary ?? self.summary,
            icon: icon ?? self.icon,
            sunriseTime: sunriseTime ?? self.sunriseTime,
            sunsetTime: sunsetTime ?? self.sunsetTime,
            moonPhase: moonPhase ?? self.moonPhase,
            precipIntensity: precipIntensity ?? self.precipIntensity,
            precipIntensityMax: precipIntensityMax ?? self.precipIntensityMax,
            precipIntensityMaxTime: precipIntensityMaxTime ?? self.precipIntensityMaxTime,
            precipProbability: precipProbability ?? self.precipProbability,
            precipType: precipType ?? self.precipType,
            temperatureHigh: temperatureHigh ?? self.temperatureHigh,
            temperatureHighTime: temperatureHighTime ?? self.temperatureHighTime,
            temperatureLow: temperatureLow ?? self.temperatureLow,
            temperatureLowTime: temperatureLowTime ?? self.temperatureLowTime,
            apparentTemperatureHigh: apparentTemperatureHigh ?? self.apparentTemperatureHigh,
            apparentTemperatureHighTime: apparentTemperatureHighTime ?? self.apparentTemperatureHighTime,
            apparentTemperatureLow: apparentTemperatureLow ?? self.apparentTemperatureLow,
            apparentTemperatureLowTime: apparentTemperatureLowTime ?? self.apparentTemperatureLowTime,
            dewPoint: dewPoint ?? self.dewPoint,
            humidity: humidity ?? self.humidity,
            pressure: pressure ?? self.pressure,
            windSpeed: windSpeed ?? self.windSpeed,
            windGust: windGust ?? self.windGust,
            windGustTime: windGustTime ?? self.windGustTime,
            windBearing: windBearing ?? self.windBearing,
            cloudCover: cloudCover ?? self.cloudCover,
            uvIndex: uvIndex ?? self.uvIndex,
            uvIndexTime: uvIndexTime ?? self.uvIndexTime,
            visibility: visibility ?? self.visibility,
            ozone: ozone ?? self.ozone,
            temperatureMin: temperatureMin ?? self.temperatureMin,
            temperatureMinTime: temperatureMinTime ?? self.temperatureMinTime,
            temperatureMax: temperatureMax ?? self.temperatureMax,
            temperatureMaxTime: temperatureMaxTime ?? self.temperatureMaxTime,
            apparentTemperatureMin: apparentTemperatureMin ?? self.apparentTemperatureMin,
            apparentTemperatureMinTime: apparentTemperatureMinTime ?? self.apparentTemperatureMinTime,
            apparentTemperatureMax: apparentTemperatureMax ?? self.apparentTemperatureMax,
            apparentTemperatureMaxTime: apparentTemperatureMaxTime ?? self.apparentTemperatureMaxTime
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Flags
struct Flags: Codable {
    let sources: [String]
    let nearestStation: Double
    let units: String

    enum CodingKeys: String, CodingKey {
        case sources
        case nearestStation = "nearest-station"
        case units
    }
}

// MARK: Flags convenience initializers and mutators

extension Flags {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Flags.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        sources: [String]? = nil,
        nearestStation: Double? = nil,
        units: String? = nil
    ) -> Flags {
        return Flags(
            sources: sources ?? self.sources,
            nearestStation: nearestStation ?? self.nearestStation,
            units: units ?? self.units
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let summary, icon: String
    let data: [Currently]
}

// MARK: Hourly convenience initializers and mutators

extension Hourly {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Hourly.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        summary: String? = nil,
        icon: String? = nil,
        data: [Currently]? = nil
    ) -> Hourly {
        return Hourly(
            summary: summary ?? self.summary,
            icon: icon ?? self.icon,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Minutely
struct Minutely: Codable {
    let summary, icon: String
    let data: [MinutelyDatum]
}

// MARK: Minutely convenience initializers and mutators

extension Minutely {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Minutely.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        summary: String? = nil,
        icon: String? = nil,
        data: [MinutelyDatum]? = nil
    ) -> Minutely {
        return Minutely(
            summary: summary ?? self.summary,
            icon: icon ?? self.icon,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - MinutelyDatum
struct MinutelyDatum: Codable {
    let time: Int
    let precipIntensity, precipProbability: Double
    let precipIntensityError: Double?
    let precipType: String?
}

// MARK: MinutelyDatum convenience initializers and mutators

extension MinutelyDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MinutelyDatum.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        time: Int? = nil,
        precipIntensity: Double? = nil,
        precipProbability: Double? = nil,
        precipIntensityError: Double?? = nil,
        precipType: String?? = nil
    ) -> MinutelyDatum {
        return MinutelyDatum(
            time: time ?? self.time,
            precipIntensity: precipIntensity ?? self.precipIntensity,
            precipProbability: precipProbability ?? self.precipProbability,
            precipIntensityError: precipIntensityError ?? self.precipIntensityError,
            precipType: precipType ?? self.precipType
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
