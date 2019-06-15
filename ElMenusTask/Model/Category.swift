//
//	Category.swift

import Foundation

struct Category : Codable {

	let descriptionField : String?
	let id : Int?
	let items : [Item]?
	let name : String?


	enum CodingKeys: String, CodingKey {
		case descriptionField = "description"
		case id = "id"
		case items = "items"
		case name = "name"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		items = try values.decodeIfPresent([Item].self, forKey: .items)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}


}
