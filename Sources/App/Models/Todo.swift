import FluentPostgreSQL
import Vapor


final class User: PostgreSQLModel {
    var id: Int?
 //   var username: String
    var altitude : Double
    var username : String
    var position : Int
   // var mycoordinate : Coordinate

    init(id: Int? = nil, /*username: String*/altitude : Double,username: String/*,mycoordinate : Coordinate */,position : Int) {
        self.id = id
   //     self.username = username
        self.altitude = altitude
        self.username = username
        self.position = position
        //self.mycoordinate = mycoordinate
    }
 //   struct Coordinate {
 //       let lon, lat: String
 //   }
}
final class Coordinate: PostgreSQLModel {
    var id: Int?
    
    let lon, lat: Double

    init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }
}


extension User: Content {}
extension User: Migration {}
extension User: Parameter {}

extension Coordinate: Content {}
extension Coordinate: Migration {}
extension Coordinate: Parameter {}
