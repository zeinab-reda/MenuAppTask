//
//	RootClass.swift

import Foundation

struct MenuReponse : Codable {

	let categories : [Category]?


	enum CodingKeys: String, CodingKey {
		case categories = "categories"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		categories = try values.decodeIfPresent([Category].self, forKey: .categories)
	}


}
