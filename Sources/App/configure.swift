import Vapor
import FluentPostgreSQL


/// Called before your application initializes.
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {

    /// Register routes to the router
    try services.register(FluentPostgreSQLProvider())
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    // Configure a PostgreSQL database
    let postgreSQLConfig : PostgreSQLDatabaseConfig
    if let url = Environment.get("DATABASE_URL") {
        postgreSQLConfig = PostgreSQLDatabaseConfig(url: url)!
    } else {
        postgreSQLConfig = PostgreSQLDatabaseConfig(hostname: "localhost", username: "brazil")
    }
    
    let postgreSQL = PostgreSQLDatabase(config: postgreSQLConfig)

    // Register the configured PostreSQL database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: postgreSQL, as: .psql)
    services.register(databases)
    // magration
    var migrations = MigrationConfig()
    migrations.add(model: User.self, database: .psql)
    services.register(migrations)
}
