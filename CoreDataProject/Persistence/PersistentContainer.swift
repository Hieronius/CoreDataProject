import Foundation
import CoreData

/**
	A class that manages the Core Data stack for the application.
	It provides a wrapper around the NSPersistentContainer class.
*/
class PersistentContainer: NSPersistentContainer {

	/// The main context used for interacting with the Core Data stack.
	lazy var viewContext: NSManagedObjectContext = {
		return persistentContainer.viewContext
	}()

	/**
		Initializes the PersistentContainer with the specified name.

		- Parameter name: The name of the Core Data model.
	*/
	init(name: String) {
		// Get the URL for the Core Data model file
		let modelURL = Bundle.main.url(forResource: name, withExtension: "momd")!
		// Load the Core Data model
		guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
			fatalError("Unable to load model file.")
		}
		// Initialize the persistent container with the model
		persistentContainer = NSPersistentContainer(name: name, managedObjectModel: model)
		super.init()
	}

	/**
		Loads the persistent stores for the container.

		- Parameter completionHandler: A closure to be called upon completion.
	*/
	func loadPersistentStores(completionHandler: @escaping (Error?) -> Void) {
		// Get the persistent container
		let container = persistentContainer
		// Create a persistent store description
		let description = NSPersistentStoreDescription(url: storeURL)
		description.configuration = name
		// Set the persistent store descriptions
		container.persistentStoreDescriptions = [description]
		// Load the persistent stores
		container.loadPersistentStores { (storeDescription, error) in
			// Check for errors
			if let error = error {
				fatalError("Unresolved error \(error)")
			}
		}
	}
}

