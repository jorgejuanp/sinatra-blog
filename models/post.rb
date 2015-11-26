###############################################
# jorge juan perales | nov 2015 | Sinatra Blog
###############################################

class Post
  attr_reader :title, :date, :author, :category, :excerpt, :text, :sponsored

  def initialize(title, date, author, category, excerpt, text, sponsored = false)
    @title = title
    @date = date
    @author = author
    @category = category
    @excerpt = excerpt
    @text = text
    @sponsored = sponsored
  end
end
