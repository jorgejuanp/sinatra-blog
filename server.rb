###############################################
# jorge juan p. | nov 2015 | Sinatra Blog
###############################################
require 'rubygems'
require 'sinatra'
#auto-reloader:
require 'sinatra/reloader' if development?
require './models/blog.rb'
require './models/post.rb'


#create blog and some posts:
blog = Blog.new(8)
blog.add_post_to_blog_archive("The Mars Volta", Date.new(2015,2,23), "admin", "music", "The Mars Volta was an American rock band from El Paso, Texas, formed in 2001. The band formed following the break-up of Rodríguez-López and Bixler-Zavala's previous band, At the Drive-In. In 2009, the band won a Grammy Award in the \"Best Hard Rock Performance\".", "The band's final lineup consisted of Omar Rodríguez-López (guitar, producer, direction), Cedric Bixler-Zavala (vocals, lyrics), Juan Alderete (bass), Marcel Rodríguez-López (keyboards, percussion) and Deantoni Parks (drums). The band formed following the break-up of Rodríguez-López and Bixler-Zavala's previous band, At the Drive-In. They are known for their energetic live shows and their concept albums. In 2009, the band won a Grammy Award in the \"Best Hard Rock Performance\" category for the song \"Wax Simulacra\".[1] In 2008, they were named \"Best Prog-Rock Band\" by Rolling Stone magazine.[2]", true)

blog.add_post_to_blog_archive("Mahavishnu Orquestra", Date.new(2015,10,14),
"admin", "music", "The band's original lineup featured \"Mahavishnu\" John McLaughlin on acoustic and electric guitars. This group was considered an important pioneer in the jazz fusion movement. McLaughlin was also influenced in his conception of the band by his studies with Indian guru Sri Chinmoy.", "With members Billy Cobham on drums, Rick Laird on bass guitar (although Tony Levin was the first person McLaughlin called to join the band),[2][3] Jan Hammer on electric and acoustic piano and synthesizer, and Jerry Goodman on violin. This first incarnation of the ensemble was a multinational group: McLaughlin is from Yorkshire, England; Cobham from Panama; Hammer from Prague, Czechoslovakia; Goodman from Chicago, Illinois; and Laird from Dublin, Ireland. This group was considered an important pioneer in the jazz fusion movement. McLaughlin and Cobham met while performing and recording with Miles Davis during the Bitches Brew sessions. McLaughlin was also influenced in his conception of the band by his studies with Indian guru Sri Chinmoy, who encouraged him to take the name \"Mahavishnu\" which means \"Divine compassion, power and justice.\" or simply \"Great Vishnu\", an aspect of Vishnu.", true)

blog.add_post_to_blog_archive("Skatilites", Date.new(2015,4,18), "admin", "music", "The founders of the Skatalites were Tommy McCook (died 1998), Rolando Alphonso (died 1998), Lester Sterling, Lloyd Brevett (died 2012), Lloyd Knibb (died 2011), Don Drummond (died 1969), Jah Jerry Haynes (died 2007), Jackie Mittoo (died 1990), Johnny Moore (died 2008) and Jackie Opel (died 1970).", "These ten musicians started to play together from 1955, when Kingston's recording studios started to develop. Tommy McCook was the first member of the band to record, though not for commercial release: he played with Don Hitchman's Group in 1953. Archie Lindo asked Hitchman to play a few tunes for his pioneer radio station, \"ZQI\", on their new equipment. Soon after that, sound system pioneer Stanley Motta began to operate his studio, where he recorded calypso and mento that were released on 78's. Rolando Alphonso was one of the first to record with him, probably in 1954.", true)

blog.add_post_to_blog_archive("Bad Religion", Date.new(2015,6,21), "admin", "music", "Bad Religion is an American punk rock band that formed in Los Angeles, California in 1980. The band makes extensive use of soaring 3-part vocal harmonies (which they refer to in their album liner notes as the \"oozin\" aahs), guitar solos and lyrics that often contain religious and political commentary.", "The band makes extensive use of soaring 3-part vocal harmonies (which they refer to in their album liner notes as the \"oozin\" aahs), guitar solos and lyrics that often contain religious and political commentary. Their lyrics often relate to matters of social responsibility. The band's lineup has changed several times over its lifespan, with lead vocalist Greg Graffin being the only consistent member; the current lineup, however, features three of the band's four original members (Graffin, Brett Gurewitz and Jay Bentley). To date, Bad Religion has released sixteen studio albums, two live albums, three compilation albums, three EPs (one of which is composed of covers of Christmas songs) and two DVDs (which were both recorded live). They are one of the best-selling punk rock acts of all time,[1] having sold over 5 million albums worldwide.[2]", true)
@posts = blog.order_posts_by_date

get "/" do
  @posts = blog.order_posts_by_date

  erb :homepage
end

get "/post_details/:post_id" do
  @post_id = params[:post_id].to_i
  @post = blog.blog_archive[@post_id]

  erb :post_details
end

get "/new_post" do
  erb :new_post
end

post "/new_post" do
  @title = params[:posttitle]
  @date = Date.new(2015, 11, 5)
  @author = params[:postauthor]
  @category = params[:postcategory]
  @excerpt = params[:postexcerpt]
  @text = params[:postcontent]
  blog.add_post_to_blog_archive(@title, @date, @author, @category, @excerpt, @text)
  redirect "/"
end
