# middleman-dexterity
extension for middleman; generates thumbnails

There weren't any middleman extensions for v4 that generated thumbnails so I figured I'd do something similar to https://github.com/kubenstein/middleman-simple-thumbnailer

For whatever reason it appears that extensions get unloaded between compile time and their after_build run, so I ended up having to eschew using a hash.each and instead ended up looking through the cache directory, then nuking it

##Usage:
```
<img src="<%= create_image_thumb '/images/test-images/1.jpg','x100' %>"/> <!-- target 100px height -->
<img src="<%= create_image_thumb '/images/test-images/2.jpg','150x' %>"/> <!-- target 150px width -->
<img src="<%= create_image_thumb '/images/test-images/3.jpg','50x50' %>"/> <!-- target both -->
```

##In middleman:

Place the following in your gemfile:

`gem 'middleman-dexterity', :git => 'https://github.com/Arcaena/middleman-dexterity.git'`

Don't forget the stuff in `config.rb`, both in build and development:

`active :dexterity`

If you want to specify a different cache directory for the thumbnails:

`activate :dexterity, :cache_dir => 'thumb_cache_directory'`

Note that if `:cache_dir` is a nested directory (i.e. `cache/thumbs`) then `cache/` will be leftover after cleanup.

##Dependencies:

dunno yet, I'll get something together soon

##Todo:

* pass an array of images/sizes to generate (so that thumbs don't need to be explicitly made in a file)
* maybe just pass a minimum size and then target size and auto-thumb images over a size
* general cleanup
