//
//  SQLDatabaseDriver.swift
//  FeatherServiceTests
//
//  Created by Tibor Bodecs on 18/11/2023.
//

import FeatherService
import AsyncKit
import PostgresKit

struct PostgresRelationalDatabaseServiceBuilder: ServiceBuilder {

    let context: PostgresRelationalDatabaseServiceContext
    let pool: EventLoopGroupConnectionPool<PostgresConnectionSource>
    
    init(context: PostgresRelationalDatabaseServiceContext) {
        self.context = context
        
        self.pool = EventLoopGroupConnectionPool(
            source: context.connectionSource,
            on: context.eventLoopGroup
        )
    }
    
    func build(using config: ServiceConfig) throws -> Service {
        PostgresRelationalDatabaseService(config: config, pool: pool)
    }
    
    func shutdown() throws {
        pool.shutdown()
    }
}
