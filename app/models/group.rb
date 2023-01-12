# == Schema Information
#
# Table name: groups
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  day_of_week     :string           not null
#  instructor_name :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  time            :string
#  club_id         :bigint
#
class Group < ApplicationRecord
    validates :name, :day_of_week, :instructor_name, presence: true

    belongs_to :club

    has_many :reservations,
        dependent: :destroy

    has_many :reviews, 
        dependent: :destroy    

    has_one_attached :photo, dependent: :destroy

end
