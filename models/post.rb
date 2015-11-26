###############################################
# jorge juan perales | nov 2015 | Sinatra Blog
###############################################

class Post
  attr_reader :title, :date, :text, :sponsored

  def initialize(title, date, text, sponsored = false)
    @title = title
    @date = date
    @text = text
    @sponsored = sponsored
  end
end
