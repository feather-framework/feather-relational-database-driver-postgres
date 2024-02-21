//
//  PostgresRelationalDatabaseComponentBuilder.swift
//  PostgresRelationalDatabaseDriverPostgres
//
//  Created by Tibor Bodecs on 18/11/2023.
//

import FeatherComponent
import AsyncKit
import PostgresKit

struct PostgresRelationalDatabaseComponentBuilder: ComponentBuilder {

    let context: PostgresRelationalDatabaseComponentContext
    let pool: EventLoopGroupConnectionPool<PostgresConnectionSource>
    
    init(context: PostgresRelationalDatabaseComponentContext) {
        self.context = context
        
        self.pool = EventLoopGroupConnectionPool(
            source: context.connectionSource,
            on: context.eventLoopGroup
        )
    }
    
    func build(using config: ComponentConfig) throws -> Component {
        PostgresRelationalDatabaseComponent(config: config, pool: pool)
    }
    
    func shutdown() throws {
        pool.shutdown()
    }
}
