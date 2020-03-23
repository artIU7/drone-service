import FluentPostgreSQL
import Vapor


final class User: PostgreSQLModel,Codable {
    var id: Int?
    var username: String
    var mycoordinate : Coordinate
    
    init(id: Int? = nil, username: String, mycoordinate : Coordinate ) {
        self.id = id
        self.username = username
        self.mycoordinate = mycoordinate
    }
}
final class Coordinate: PostgreSQLModel,Codable {
    var id: Int?
    
     let lon, lat: String

       init(lon: String, lat: String) {
           self.lon = lon
           self.lat = lat
       }
}


extension User: Content {}
extension User: Migration {}
extension User: Parameter {}
