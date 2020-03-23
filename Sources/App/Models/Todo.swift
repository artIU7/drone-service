import FluentPostgreSQL
import Vapor


final class User: PostgreSQLModel {
    var id: Int?
    var username: String
 //   var altitude : Double
   // var mycoordinate : Coordinate

    init(id: Int? = nil, username: String/*,altitude : Double*//*,mycoordinate : Coordinate */) {
        self.id = id
        self.username = username
    //    self.altitude = altitude
        //self.mycoordinate = mycoordinate
    }
 //   struct Coordinate {
 //       let lon, lat: String
 //   }
}
/*final class Coordinate: PostgreSQLModel,Codable {
    var id: Int?
    
     let lon, lat: String

       init(lon: String, lat: String) {
           self.lon = lon
           self.lat = lat
       }
} */


extension User: Content {}
extension User: Migration {}
extension User: Parameter {}
