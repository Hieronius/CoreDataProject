import Foundation
import CoreData

// The ParticipantMO class represents a Core Data managed object for a participant.
@objc(ParticipantMO)
public class ParticipantMO: NSManagedObject {

}

extension ParticipantMO {

	// Returns a fetch request for ParticipantMO entities.
	@nonobjc public class func fetchRequest() -> NSFetchRequest<ParticipantMO> {
		return NSFetchRequest<ParticipantMO>(entityName: "ParticipantMO")
	}

	// Managed properties for ParticipantMO entity.
	@NSManaged public var name: String
	@NSManaged public var uid: UUID
	@NSManaged public var budgetItem: NSSet?

}
