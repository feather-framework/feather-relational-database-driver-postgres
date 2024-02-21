//
//  PostgresRelationalDatabaseComponent.swift
//  PostgresRelationalDatabaseDriverPostgres
//
//  Created by Tibor Bodecs on 03/12/2023.
//

import FeatherComponent
import FeatherRelationalDatabase
import SQLKit
import PostgresKit
@preconcurrency import AsyncKit

@dynamicMemberLookup
struct PostgresRelationalDatabaseComponent: RelationalDatabaseComponent {
    
    public let config: ComponentConfig
    let pool: EventLoopGroupConnectionPool<PostgresConnectionSource>

    subscript<T>(
        dynamicMember keyPath: KeyPath<PostgresRelationalDatabaseComponentContext, T>
    ) -> T {
        let context = config.context as! PostgresRelationalDatabaseComponentContext
        return context[keyPath: keyPath]
    }

    init(
        config: ComponentConfig,
        pool: EventLoopGroupConnectionPool<PostgresConnectionSource>
    ) {
        self.config = config
        self.pool = pool
    }
    
    public func connection() async throws -> SQLKit.SQLDatabase {
        pool.database(logger: self.logger).sql()
    }
    
}
