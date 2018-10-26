class User < ActiveRecord::Base
    has_secure_password

    has_many :ideas
    has_many :likes,
        dependent: :destroy
    has_many :ideas_liked,
        source: :idea,
        through: :likes

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

    validates :name, :alias, :password,
        presence: true,
        length: { in: 3..20 }
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false },
        format: { with: EMAIL_REGEX }

    before_save :downcase_email

    after_create :successfully_created

    after_update :successfully_updated

    private
        def downcase_email
            self.email.downcase!
        end

        def successfully_created
            puts "Successfully created a new user"
        end

        def successfully_updated
            puts "Successfully updated a existing user"
        end
end
