# == Schema Information
#
# Table name: groups
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  day_of_week     :string           not null
#  instructor_name :string           not null
#  location        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  time            :string
#
class Group < ApplicationRecord
    validates :name, :day_of_week, :instructor_name, :location, presence: true

    has_many :reservations,
        dependent: :destroy

    has_many :reviews, 
        dependent: :destroy    

    has_one_attached :photo    

end
