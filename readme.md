# Simple scraper with Ruby experiment

Trying the tutorial here: https://www.youtube.com/watch?v=b3CLEUBdWwQ&t=289s

Trying this on a newly installed computer -- doing this on my old laptop didn't work, perhaps because it was using (old) system Ruby on an older edition of MacOS. 

## Details of my development box setup

Details of my setup can be found in my setup guide.  

I am using a new Mac laptop using MacOS Monterey 12.4 and `ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [arm64-darwin21]` installed using `asdf` using the instructions found in the [Mac Install Guide: Ruby](https://mac.install.guide/ruby/). 

## Starting Anew

On my old box, I wasn't able to get very far because the dependencies I needed failed. 

I now have new Ruby and installed `nokogiri` using `gem install nokogiri`. It installed without incident. I ran the `gem install` command in both /code and in my project file, `auto-lisa`. 

## Successful `bundle install` 

In our new environment, running `bundle install` gives the following output: 

```
lisawilliams@Lisas-MacBook-Air auto-lisa % bundle install
Fetching gem metadata from https://rubygems.org/...........
Resolving dependencies...
Using racc 1.6.0
Using bundler 2.3.7
Fetching mime-types-data 3.2022.0105
Fetching multi_xml 0.6.0
Fetching byebug 11.1.3
Using nokogiri 1.13.6 (arm64-darwin)
Installing multi_xml 0.6.0
Installing byebug 11.1.3 with native extensions
Installing mime-types-data 3.2022.0105
Fetching mime-types 3.4.1
Installing mime-types 3.4.1
Fetching httparty 0.20.0
Installing httparty 0.20.0
Bundle complete! 3 Gemfile dependencies, 8 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
Post-install message from httparty:
When you HTTParty, you must party hard!
lisawilliams@Lisas-MacBook-Air auto-lisa % 
```

Looks like `bundle install` ran succesfully to me. 

## Successful initial test

Setting up scraper.rb and running it produces the following results: 

```
lisawilliams@Lisas-MacBook-Air auto-lisa % ruby scraper.rb
[DEPRECATION] HTTParty will no longer override `response#nil?`. This functionality will be removed in future versions. Please, add explicit check `response.body.nil? || response.body.empty?`. For more info refer to: https://github.com/jnunemaker/httparty/issues/568
/Users/lisawilliams/.asdf/installs/ruby/3.1.2/lib/ruby/gems/3.1.0/gems/nokogiri-1.13.6-arm64-darwin/lib/nokogiri/html4/document.rb:214:in `parse'
Return value is: nil

[7, 16] in /Users/lisawilliams/code/auto-lisa/scraper.rb
    7: # build methods
    8: 
    9: def scraper
   10: 	url = "URL I AM USING"
   11: 	unparsed_page = HTTParty.get(url)
   12: 	parsed_page = Nokogiri::HTML(unparsed_page)
   13: 	byebug
=> 14: end
   15: 
   16: scraper
(byebug) 
```

There is a way to clear that `[DEPRECATION` error documented here: [HTTParty Deprecation/nil, Stack Overflow](https://stackoverflow.com/questions/61590268/deprecation-httparty-will-no-longer-override-responsenil-what-does-this-de)

Changing `parsed_page = Nokogiri::HTML(unparsed_page)` to `parsed_page = Nokogiri::HTML(unparsed_page.body)` and then running `ruby scraper.rb` produces the following: 


```
lisawilliams@Lisas-MacBook-Air auto-lisa % ruby scraper.rb
Return value is: nil

[7, 16] in /Users/lisawilliams/code/auto-lisa/scraper.rb
    7: # build methods
    8: 
    9: def scraper
   10: 	url = "URL I AM USING"
   11: 	unparsed_page = HTTParty.get(url)
   12: 	parsed_page = Nokogiri::HTML(unparsed_page.body)
   13: 	byebug
=> 14: end
   15: 
   16: scraper
(byebug) url
```

## Accessing HTML and CSS elements of parsed pages via Nokogiri

```
(byebug) parsed_page.css('div.ListMod-items-item')
[]
(byebug) parsed_page.css('div.PromoLede-title')
[]
(byebug) parsed_page.css('div.ListMod')
```

So, we can use `nokogiri` to inquire into the parsed page. For instance. we can use the .css function to point at a specific CSS class. 

Notably, it looks like `nokogiri` will look at the top-level class but not the subclasses. Like for `div.ListMod-items-item` it returns a null set `[]`. But for `div.ListMod` it returns a ton of text...but assigning that to a variable like `listItem` and then doing `listItem.count` returns a value of 1. Interesting. 