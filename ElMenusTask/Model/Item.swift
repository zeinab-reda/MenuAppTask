//
//	Item.swift

import Foundation

struct Item : Codable {

	let descriptionField : String?
	let id : Int?
	let name : String?


	enum CodingKeys: String, CodingKey {
		case descriptionField = "description"
		case id = "id"
		case name = "name"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}


}
