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

You can also generate squared thumbnails:
```
<img src="<%= create_square_thumb '/images/test-images/2.jpg','200' %>"/>
```
The first parameter is the image path (the full `/images/test-images/2.jpg` works, or just `test-images/2.jpg`), and the 2nd is the number of pixels per side of the generated thumb.



##In middleman:

Place the following in your gemfile:

`gem 'middleman-dexterity', :git => 'https://github.com/Arcaena/middleman-dexterity.git'`

Don't forget the stuff in `config.rb`, both in build and development:

`active :dexterity`

If you want to specify a different cache directory for the thumbnails:

`activate :dexterity, :cache_dir => 'thumb_cache_directory'`

Note that if `:cache_dir` is a nested directory (i.e. `cache/thumbs`) then `cache/` will be leftover after cleanup.

You can also disable clearing the cache with the following options:
```
activate :dexterity, :pre_clear_cache => false, :post_clear_cache => true
```
It appears that clearing the cache on initialization breaks when using livereload, so disable clearing the cache in init in :development.

So far I haven't figured out a way to clear the cache when a middleman server exits, so `post_clear_cache` does nothing in :development.

##Dependencies:

dunno yet, I'll get something together soon

##Todo:

* pass an array of images/sizes to generate (so that thumbs don't need to be explicitly made in a file)
* maybe just pass a minimum size and then target size and auto-thumb images over a size
* general cleanup
