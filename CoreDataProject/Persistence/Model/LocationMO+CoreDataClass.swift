import Foundation
import CoreData

// The LocationMO class represents a Core Data managed object for a location.
@objc(LocationMO)
public class LocationMO: NSManagedObject {

}

extension LocationMO {

	// Returns a fetch request for LocationMO entities.
	@nonobjc public class func fetchRequest() -> NSFetchRequest<LocationMO> {
		return NSFetchRequest<LocationMO>(entityName: "LocationMO")
	}

	// Managed properties for LocationMO entity.
	@NSManaged public var latitude: Double
	@NSManaged public var longitude: Double
	@NSManaged public var title: String?
	@NSManaged public var uid: UUID
	@NSManaged public var budgetItem: BudgetItemMO?

}

