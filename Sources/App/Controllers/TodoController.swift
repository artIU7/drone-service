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
            return User.query(on: req)
            .all()
    }
    func list1(_ req: Request) throws -> Future<[User]> {
               let users =  User.query(on: req)
                .join(\Coordinate.id,to: \User.positionID)
                .filter(\User.positionID >= 2)
                .all()
        print(users)
        return users
    }
    func list2(_ req: Request) throws -> Future<[User]> {
               let users =  User.query(on: req)
                .join(\Coordinate.id,to: \User.positionID)
                //.alsoDecode(User.self)
                .all()
        print(users)
        return users
    }
    func list3(_ req: Request) throws -> Future<[User]> {
                return User.query(on: req)
                 .join(\User.positionID,to: \Coordinate.id )
                 //.alsoDecode(User.self)
                 .all()
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
