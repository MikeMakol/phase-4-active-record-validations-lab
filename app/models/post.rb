class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    CLICKBAITS = [ /Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i ]

    def clickbait
        errors.add(:title, "must be clickbait") unless CLICKBAITS.any? { |pat| pat.match(title)}
    end
end
