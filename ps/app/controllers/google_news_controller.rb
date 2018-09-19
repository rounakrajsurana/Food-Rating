class GoogleNewsController < ApplicationController
	
def data_scraper
	require 'nokogiri'
	require 'open-uri'
	#require 'pry'
	head = Nokogiri::HTML(open('https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRFZxYUdjU0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen', proxy: URI.parse("http://192.41.170.23:3128") ) )
	# head = Nokogiri::HTML(open('https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRGx1YlY4U0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen', proxy: URI.parse("http://192.41.170.23:3128") ) )
	@main = head.search('main')
	@fig = @main[0].search('figure')
	@news = []
	@fig.each do |f|
	    div = f.parent
	    articles = div.search('article')
	    figure = div.search('figure')
	    @news.push({figure: figure, articles: articles})
	end
end
end
	#@fig[0].parent.search('figure')
        #@fig[0].parent.search('article')
       # @article= @fig[0].parent.search('article')
       # @title= @article[0].parent.search('span')
	#i = 0
	#@fig.each do |f|
	#news[i]['img']= uri: ''
	#end 	 
	#@article.each do |a|
         #  i++;
          #      news[i]['article']= uri: ''


       # end
#	 news.each do |n|
                
 #               news['article']['img']=


  #      end

#	@fig[0].parent.search('figure')
#	@fig[0].parent.search('article')
#	@article= @fig[0].parent.search('article')
#	@title= @article[0].parent.search('span')

	#@title =@main[].search('span')[1]
	#@description=@main[2].search('article')[2]
	#main[0].search('figure')[0]
	#@content = head.css('xrnccd F6Welf R7GTQ keNKEd j7vNaf')
	#@article = @content.push ('VDXfz')
	#@links= @content.push ('tvs3Id dIH98c')
	#@title=@content.push ('mEaVNd')

