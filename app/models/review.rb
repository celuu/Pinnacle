# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  group_id   :bigint
#  summary    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Review < ApplicationRecord

    belongs_to :user
    belongs_to :group
end
