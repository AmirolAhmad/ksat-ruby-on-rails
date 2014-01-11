class TaskItem < ActiveRecord::Base
  belongs_to :ksat_list

  validates :content, presence: true,
  					  length: { minimum: 2 }
end
