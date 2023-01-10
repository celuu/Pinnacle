# == Schema Information
#
# Table name: clubs
#
#  id         :bigint           not null, primary key
#  location   :string           not null
#  latitude   :float            not null
#  longitude  :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Club < ApplicationRecord
    validates :location, :latitude, :longitude, presence: true

    has_many :groups,
        dependent: :destroy


end
