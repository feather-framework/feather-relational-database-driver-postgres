//
//  PostgresRelationalDatabaseComponentContext.swift
//  PostgresRelationalDatabaseDriverPostgres
//
//  Created by Tibor Bodecs on 18/11/2023.
//

import FeatherComponent
@preconcurrency import PostgresKit

public struct PostgresRelationalDatabaseComponentContext: ComponentContext {

    let eventLoopGroup: EventLoopGroup
    let connectionSource: PostgresConnectionSource
    
    public init(
        eventLoopGroup: EventLoopGroup,
        connectionSource: PostgresConnectionSource
    ) {
        self.eventLoopGroup = eventLoopGroup
        self.connectionSource = connectionSource
    }

    public func make() throws -> ComponentBuilder {
        PostgresRelationalDatabaseComponentBuilder(context: self)
    }
}
