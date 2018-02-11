class Task < ApplicationRecord
  belongs_to :project

  # callback
  # run the update_percent_compete if mark_complete is true
  after_save :update_percent_complete if :mark_completed?

  scope :completed, -> { where(completed: true)}

  def mark_completed
  	self.completed == true
  end

  def update_percent_complete
  	project = Project.find(self.project_id)
  	# had to add the completed scope
  	count_of_completed_tasks = project.tasks.completed.count
    count_of_total_tasks = project.tasks.count
    project.update!(percent_complete: Counter.calculate_percent_complete(count_of_completed_tasks, count_of_total_tasks))
  end 

end
