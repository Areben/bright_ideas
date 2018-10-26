class Idea < ActiveRecord::Base
    belongs_to :user

    has_many :likes,
        dependent: :destroy

    has_many :users,
        through: :likes

    validates :idea,
        presence: true

    after_create :successfully_created

    after_update :successfully_updated

    private
        def successfully_created
            puts "Successfully created a new idea"
        end

        def successfully_updated
            puts "Successfully updated a existing idea"
        end
end
