import Foundation
import CoreData

// The BudgetItemMO class represents a Core Data managed object for a budget item.
@objc(BudgetItemMO)
public class BudgetItemMO: NSManagedObject {

}

extension BudgetItemMO {

	// Returns a fetch request for BudgetItemMO entities.
	@nonobjc public class func fetchRequest() -> NSFetchRequest<BudgetItemMO> {
		return NSFetchRequest<BudgetItemMO>(entityName: "BudgetItemMO")
	}

	// Managed properties for BudgetItemMO entity.
	@NSManaged public var amountPerParticipant: Double
	@NSManaged public var category: String
	@NSManaged public var comment: String?
	@NSManaged public var date: Date
	@NSManaged public var image: Data?
	@NSManaged public var totalAmount: Double
	@NSManaged public var transaction: String
	@NSManaged public var uid: UUID
	@NSManaged public var location: LocationMO?
	@NSManaged public var participants: Set<ParticipantMO>

}

// MARK: Generated accessors for participants
extension BudgetItemMO {

	// Add a participant to the participants set.
	@objc(addParticipantsObject:)
	@NSManaged public func addToParticipants(_ value: ParticipantMO)

	// Remove a participant from the participants set.
	@objc(removeParticipantsObject:)
	@NSManaged public func removeFromParticipants(_ value: ParticipantMO)

	// Add multiple participants to the participants set.
	@objc(addParticipants:)
	@NSManaged public func addToParticipants(_ values: NSSet)

	// Remove multiple participants from the participants set.
	@objc(removeParticipants:)
	@NSManaged public func removeFromParticipants(_ values: NSSet)

}
