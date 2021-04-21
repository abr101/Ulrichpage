class Dashboard < ApplicationRecord
	enum page_type: {contact_us: 0, about_us: 1, terms: 2, privacy: 3}
end