# Simple scraper with Ruby experiment

Trying the tutorial here: https://www.youtube.com/watch?v=b3CLEUBdWwQ&t=289s

Trying this on a newly installed computer -- doing this on my old laptop didn't work, perhaps because it was using (old) system Ruby on an older edition of MacOS. 

## Details of my development box setup

Details of my setup can be found [here](https://github.com/lisawilliams/setup). 

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

## 