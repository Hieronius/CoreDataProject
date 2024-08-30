import CoreData

// The Participant struct represents a participant model with a name and a unique identifier
	struct Participant {
		// The name of the participant.
		var name: String
		// The unique identifier for the participant.
		var uid: UUID = UUID()
	}

// The Participant extension provides an initializer for creating a Participant instance based on data from a ParticipantMO entity from a Core Data database.
extension Participant {
	init(_ mo: ParticipantMO) {
		// Set the name for the participant to the name of the ParticipantMO entity.
		name = mo.name
		// Set the unique identifier for the participant to the UUID of the ParticipantMO entity.
		uid = mo.uid
	}
}
