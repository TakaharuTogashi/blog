class Article < ActiveRecord::Base
  validates :title,
    length: { maximum: 50, too_long: '50字以内で入力してください' }
  validates :text,
    length: { maximum: 1000, too_long: '1000字以内で入力してください' }

  def previous
    Article.where("id > ?", self.id).order("id ASC").first
  end

  def next
    Article.where("id < ?", self.id).order("id DESC").first
  end
end
