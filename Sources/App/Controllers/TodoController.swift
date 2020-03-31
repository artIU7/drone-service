import Vapor
import Fluent

final class UserController {
    /*
      func create(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(Pokemon.PokemonForm.self).flatMap { pokemonForm in
            return User.find(pokemonForm.userId, on: req)
              .flatMap { user in
                guard let userId = try user?.requireID() else {
                  throw Abort(.badRequest)
                }
                let pokemon = Pokemon(
                  name: pokemonForm.name,
                  level: pokemonForm.level,
                  userID: userId
                )
                return pokemon.save(on: req).map { _ in
                  return req.redirect(to: "/users")
                }
            }
          }
      }
    }
     // add token
    */
    // view with users
    func list(_ req: Request) throws -> Future<[User]> {
             User.query(on: req)
             //.join(\User.positionID,to: \Coordinate.id)
             .filter(\User.positionID >= 2)
                    .all()
        //let booking = Booking.query(on: req).join(\Booking.product, to:\Product.id).filter(\.user_id == userID).all()

        /*Point.query(on: req)
       .join(field: \OrderPoint.pointID)
       .filter(OrderPoint.self, \OrderPoint.orderID == order.id!)
       .all()*/
        /*let joinData = req.withPooledConnection(to: .psql) { (conn) -> Future<[User]> in
            conn.raw("SELECT DISTINCT ON(<my columns>) * FROM <my_table> INNER JOIN <another_table> ON <some_condition> WHERE <conditions>")
                .all(decoding: User.self) 
        }*/
            //.join(\User.position, to: \Coordinate.id)
        
        //.all()
        
        // comment
    }
    // create a new user
    func create(_ req: Request) throws -> Future<User> {
        return try req.content.decode(User.self).flatMap { user in
            return user.save(on: req)
        }
    }

    // update a user
    func update(_ req: Request) throws -> Future<User> {
        return try req.parameters.next(User.self).flatMap { user in
            return try req.content.decode(User.self).flatMap { newUser in
                user.altitude = newUser.altitude
                return user.save(on: req)
            }
        }
    }

    // delete a user
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(User.self).flatMap { user in
            return user.delete(on: req)
        }.transform(to: .ok)
    }
}

final class CoordinateController {
    // view with users
    func list(_ req: Request) throws -> Future<[Coordinate]> {
        return Coordinate.query(on: req).all()
    }
    // create a new user
    func create(_ req: Request) throws -> Future<Coordinate> {
        return try req.content.decode(Coordinate.self).flatMap { coordinate in
            return coordinate.save(on: req)
        }
    }
}
