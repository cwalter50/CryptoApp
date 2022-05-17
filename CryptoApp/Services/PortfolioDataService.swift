//
//  PortfolioDataService.swift
//  CryptoApp
//
//  Created by Christopher Walter on 5/17/22.
//

import Foundation
import CoreData

// this will read from CoreData
class PortfolioDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data: \(error)")
            }
            self.getPortfolio()
        }
    }
    
    // MARK: Public
    func updatePortfolio(coin: CoinModel, amount: Double)
    {
        // check if coin is in portfolio.
        if let entity = savedEntities.first(where: { $0.coinID == coin.id })
        {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    
    // MARK: Private
    private func getPortfolio()
    {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching entities: \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.amount = amount
        entity.coinID = coin.id
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data: \(error)")
        }
    }
    
    private func applyChanges()
    {
        save()
        getPortfolio() // fetch all coins from context
    }
    
    private func update(entity: PortfolioEntity, amount: Double)
    {
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: PortfolioEntity)
    {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    
}
