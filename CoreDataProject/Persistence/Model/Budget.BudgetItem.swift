
//  This code defines a struct called BudgetItem, which represents a single item in a budget.
//  The struct contains properties for the item's unique identifier, date, total amount, amount per participant, participants, category, transaction type, image, comment, and location.
//  The struct also includes a private method for defining the transaction type based on the category.
//  Additionally, there is an extension that provides an initializer for creating a BudgetItem instance based on data from a BudgetItemMO entity from a Core Data database.

import CoreData

	struct BudgetItem {
		// The unique identifier for the budget item.
		private(set) var uid: UUID = UUID()
		// The date of the budget item.
		var date: Date
		// The total amount of the budget item.
		var totalAmount: Double {
			// This willSet observer is called before the totalAmount property is set to a new value.
			// It calculates the amount per participant based on the new total amount and the number of participants.
			willSet {
				amountPerParticipant = newValue / Double(participants.count)
			}
		}

		// This lazy property is calculated the first time it is accessed.
		// It calculates the amount per participant based on the total amount and the number of participants.
		private(set) lazy var amountPerParticipant: Double = totalAmount / Double(participants.count)
		// The array of participants for the budget item.
		var participants: [Participant] {
			// This willSet observer is called before the participants property is set to a new value.
			// It calculates the amount per participant based on the new number of participants.
			willSet {
				amountPerParticipant = totalAmount / Double(newValue.count)
			}
		}

		// The category of the budget item.
		var category: Category {
			// This didSet observer is called after the category property is set to a new value.
			// It sets the transaction type based on the category.
			didSet {
				if category as? Expense != nil {
					transaction = .expense
				} else {
					transaction = .income
				}
			}
		}
		// The transaction type of the budget item.
		lazy var transaction: TransactionType = defineTransactionType(category)

		// The image for the budget item.
		var image: Data?
		// The comment for the budget item.
		var comment: String?
		// The location for the budget item.
		var location: Location?

		// A private method for defining the transaction type based on the category.
		private func defineTransactionType(_ category: Category) -> TransactionType {
			if category as? Expense != nil {
				return .expense
			} else {
				return .income
			}
		}

	}

// An extension for the Budget.BudgetItem struct that provides an initializer for creating a BudgetItem instance based on data from a BudgetItemMO entity from a Core Data database.
extension BudgetItem {

	init(_ mo: BudgetItemMO) {
		// Set the unique identifier for the budget item to the UUID of the BudgetItemMO entity.
		self.uid = mo.uid
		// Set the date for the budget item to the date of the BudgetItemMO entity.
		self.date = mo.date
		// Set the total amount for the budget item to the total amount of the BudgetItemMO entity.
		self.totalAmount = mo.totalAmount
		// Set the participants for the budget item to an array of Participant instances created from the participants of the BudgetItemMO entity.
		self.participants = mo.participants.map { Budget.Participant($0) }
		// Set the category for the budget item to the corresponding Category instance based on the raw value of the category of the BudgetItemMO entity.
		self.category = {
			if let category = Budget.Expense(rawValue: mo.category) {
				return category
			}
			if let category = Budget.Income(rawValue: mo.category) {
				return category
			}
			return Budget.Expense.health
		}()
		// Set the transaction type for the budget item to the value returned by the defineTransactionType method with the category as the argument.
		self.transaction = defineTransactionType(category)
		// Set the amount per participant for the budget item to the amount per participant of the BudgetItemMO entity.
		self.amountPerParticipant = mo.amountPerParticipant
		// Set the image for the budget item to the image of the BudgetItemMO entity.
		self.image = mo.image
		// Set the comment for the budget item to the comment of the BudgetItemMO entity.
		self.comment = mo.comment
		// Set the location for the budget item to the Location instance created from the location of the BudgetItemMO entity.
		self.location = mo.location.map { Budget.Location($0) }
	}
}

