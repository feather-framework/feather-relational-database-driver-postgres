//
//  SQLDatabaseContext.swift
//  FeatherServiceTests
//
//  Created by Tibor Bodecs on 18/11/2023.
//

import FeatherService
@preconcurrency import PostgresKit

public struct PostgresRelationalDatabaseServiceContext: ServiceContext {

    let eventLoopGroup: EventLoopGroup
    let connectionSource: PostgresConnectionSource
    
    public init(
        eventLoopGroup: EventLoopGroup,
        connectionSource: PostgresConnectionSource
    ) {
        self.eventLoopGroup = eventLoopGroup
        self.connectionSource = connectionSource
    }

    public func make() throws -> ServiceBuilder {
        PostgresRelationalDatabaseServiceBuilder(context: self)
    }
}
