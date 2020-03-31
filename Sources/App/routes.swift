import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    let userController = UserController()
    router.get("users", use: userController.list)
    router.get("users1", use: userController.list1)
    router.get("users2",use: userController.list2)
    router.get("users3",use: userController.list3)
    router.post("users", use: userController.create)
    router.patch("users", User.parameter, use: userController.update)
    router.delete("users", User.parameter, use: userController.delete)
    //
    let coordinateController = CoordinateController()
    router.get("location", use: coordinateController.list)
    router.post("location", use: coordinateController.create)
}
