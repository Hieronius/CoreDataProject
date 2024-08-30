import Foundation
import CoreData

/**
	A class that manages the budget data for the application.
	It provides methods for creating, updating, and deleting budget items.
*/
class BudgetDataManager {

	/**
		The managed object context used for interacting with the Core Data stack.
	*/
	let managedObjectContext: NSManagedObjectContext

	/**
		Initializes the BudgetDataManager with the specified managed object context.

		- Parameter context: The managed object context to use.
	*/
	init(context: NSManagedObjectContext) {
		managedObjectContext = context
	}

	/**
		Creates a new budget item with the specified attributes.

		- Parameter amountPerParticipant: The amount per participant for the budget item.
		- Parameter category: The category for the budget item.
		- Parameter comment: The comment for the budget item.
		- Parameter date: The date for the budget item.
		- Parameter image: The image for the budget item.
		- Parameter totalAmount: The total amount for the budget item.
		- Parameter transaction: The transaction type for the budget item.
		- Parameter location: The location for the budget item.
		- Parameter participants: The participants for the budget item.

		- Returns: The newly created budget item.
	*/
	func createBudgetItem(amountPerParticipant: Double, category: String, comment: String?, date: Date, image: Data?, totalAmount: Double, transaction: String, location: LocationMO?, participants: Set<ParticipantMO>) -> BudgetItemMO {
		let newBudgetItem = BudgetItemMO(context: managedObjectContext)
		newBudgetItem.amountPerParticipant = amountPerParticipant
		newBudgetItem.category = category
		newBudgetItem.comment = comment
		newBudgetItem.date = date
		newBudgetItem.image = image
		newBudgetItem.totalAmount = totalAmount
		newBudgetItem.transaction = transaction
		newBudgetItem.location = location
		newBudgetItem.participants = participants
		return newBudgetItem
	}

	/**
		Updates an existing budget item with the specified attributes.

		- Parameter budgetItem: The budget item to update.
		- Parameter amountPerParticipant: The updated amount per participant for the budget item.
		- Parameter category: The updated category for the budget item.
		- Parameter comment: The updated comment for the budget item.
		- Parameter date: The updated date for the budget item.
		- Parameter image: The updated image for the budget item.
		- Parameter totalAmount: The updated total amount for the budget item.
		- Parameter transaction: The updated transaction type for the budget item.
		- Parameter location: The updated location for the budget item.
		- Parameter participants: The updated participants for the budget item.
	*/
	func updateBudgetItem(budgetItem: BudgetItemMO, amountPerParticipant: Double, category: String, comment: String?, date: Date, image: Data?, totalAmount: Double, transaction: String, location: LocationMO?, participants: Set<ParticipantMO>) {
		budgetItem.amountPerParticipant = amountPerParticipant
		budgetItem.category = category
		budgetItem.comment = comment
		budgetItem.date = date
		budgetItem.image = image
		budgetItem.totalAmount = totalAmount
		budgetItem.transaction = transaction
		budgetItem.location = location
		budgetItem.participants = participants
	}

	/**
		Deletes the specified budget item.

		- Parameter budgetItem: The budget item to delete.
	*/
	func deleteBudgetItem(budgetItem: BudgetItemMO) {
		managedObjectContext.delete(budgetItem)
	}

	/**
		Saves any changes made to the managed object context.
	*/
	func saveChanges() {
		do {
			try managedObjectContext.save()
		} catch {
			print("Unresolved error \(error)")
		}
	}
}
