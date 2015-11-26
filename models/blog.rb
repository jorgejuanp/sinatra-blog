###############################################
# jorge juan perales | nov 2015 | Sinatra Blog
###############################################

require 'date'

class Blog
  attr_reader :blog_archive, :posts_per_page, :add_post_to_blog_archive, :order_posts_by_date

  def initialize(posts_per_page)
    @blog_archive = []
    @posts_per_page = posts_per_page
  end

  def add_post_to_blog_archive(title, date, author, category, excerpt, text, sponsored = false)
    @blog_archive.push(Post.new(title, date, author, category, excerpt, text, sponsored))
  end

  def order_posts_by_date
    @blog_archive.sort! {|a, b| b.date <=> a.date}
  end

  # def paginate
  #   pages = (@blog_archive.length / @posts_per_page)
  #   if @blog_archive.length % @posts_per_page != 0
  #     pages += 1
  #   end
  #   paginated_blog = Array.new(pages) { Array.new(@posts_per_page) }
  #   # @blog_archive elements to bidimensional array slots
  #
  #     @blog_archive.each do |item|
  #       i, j = 0, 0
  #       paginated_blog[i][j].push(item) #push lo mete al final
  #       j += 1
  #       if j > @posts_per_page
  #         i += 1
  #         j = 0
  #       end
  #     end

    # crear array bidimensional a partir de los posts
    # la paginacion es el index+1
    # paginated_blog = [[1, 2, 3],
    #                   [1, 2, 3],
    #                   [1, 2, 3]]
  # end

  # def publish_front_page
  #   order_posts
  #   @blog_archive.each do |post|
  #     if post.sponsored == true
  #       puts "#{post.title.upcase} (#{post.date})"
  #     else
  #       puts "#{post.title} (#{post.date})"
  #     end
  #     puts "*********************************************"
  #     puts "#{post.text}"
  #     puts "------------------------\n\n"
  #   end
  # end
end
