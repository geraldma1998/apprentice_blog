class Post < ApplicationRecord
	validates :title, length: { in: 1..100 },
	                  presence: true

	validates :content, presence: true

	validates :opened, presence: true
end
