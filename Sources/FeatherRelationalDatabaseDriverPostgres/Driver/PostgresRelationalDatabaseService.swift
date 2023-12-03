//
//  File 2.swift
//  
//
//  Created by Tibor Bodecs on 03/12/2023.
//

import FeatherService
import FeatherRelationalDatabase
import SQLKit
import PostgresKit
@preconcurrency import AsyncKit

@dynamicMemberLookup
struct PostgresRelationalDatabaseService: RelationalDatabaseService {
    
    public let config: ServiceConfig
    let pool: EventLoopGroupConnectionPool<PostgresConnectionSource>

    subscript<T>(
        dynamicMember keyPath: KeyPath<PostgresRelationalDatabaseServiceContext, T>
    ) -> T {
        let context = config.context as! PostgresRelationalDatabaseServiceContext
        return context[keyPath: keyPath]
    }

    init(
        config: ServiceConfig,
        pool: EventLoopGroupConnectionPool<PostgresConnectionSource>
    ) {
        self.config = config
        self.pool = pool
    }
    
    public func connection() async throws -> SQLKit.SQLDatabase {
        pool.database(logger: self.logger).sql()
    }
    
}
