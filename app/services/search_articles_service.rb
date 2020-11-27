class SearchArticlesService
  def self.search(search)
    if search != ""
      Article.where('sentence LIKE(?)', "%#{search}%")
    else
      Article.all
    end
  end
end