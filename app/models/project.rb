class Project < ApplicationRecord
	has_many :tasks
	
	# Add Defaults
	after_initialize :set_defaults

	# Integrate validations
	validates_presence_of :title, :description, :percent_complete

	# Integrate callbacks
	# Integrating database relationshoips

	# Custom Scopes
	scope :sixty_plus, -> { where('percent_complete > 60.0')}
	scope :zero_or_nil, -> { where('percent_complete <=  0.0')}

	# Add Defaults
	def set_defaults
		self.percent_complete ||= 0.0   # if nil assign
	end

end
