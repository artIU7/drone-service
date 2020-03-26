import FluentPostgreSQL
import Vapor


final class User: PostgreSQLModel {
    var id: Int?
 //   var username: String
    var altitude : Double
    var username : String
    var positionID : Coordinate.ID
   // var mycoordinate : Coordinate

    init(id: Int? = nil, /*username: String*/altitude : Double,username: String/*,mycoordinate : Coordinate */,positionID : Coordinate.ID) {
        self.id = id
   //     self.username = username
        self.altitude = altitude
        self.username = username
        self.positionID = positionID
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
extension User {
var user: Parent<User, Coordinate> {
  return parent(\.positionID)
    }
}
extension Coordinate {
  var users: Children<Coordinate, User> {
    return children(\.positionID)
  }
}
