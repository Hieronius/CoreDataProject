import CoreData

// The Location struct represents a location model with a unique identifier, latitude, longitude, and optional title.
	struct Location {
		// The unique identifier for the location.
		var uid = UUID()
		// The latitude of the location.
		var latitude: Double
		// The longitude of the location.
		var longitude: Double
		// The title of the location, which is optional.
		var title: String?
	}

// The Location extension provides an initializer for creating a Location instance based on data from a LocationMO entity from a Core Data database.
extension Location {
	init(_ mo: LocationMO) {
		// Set the unique identifier for the location to the UUID of the LocationMO entity.
		uid = mo.uid
		// Set the latitude for the location to the latitude of the LocationMO entity.
		latitude = mo.latitude
		// Set the longitude for the location to the longitude of the LocationMO entity.
		longitude = mo.longitude
		// Set the title for the location to the title of the LocationMO entity.
		title = mo.title
	}
}

