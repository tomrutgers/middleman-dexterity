# Require core library
require 'middleman-core'

# Extension namespace
class DexterityThumbs < ::Middleman::Extension
  option :cache, 'thumbs_cache', 'default thumbnail cache directory for use in building'
  @@cache = nil
  @@images = []

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    require 'mini_magick'
    require 'base64'
    require 'fileutils'
    require 'find'
    @@cache = options.cache
  end

  def after_configuration
      @@source_dir = app.config[:source]
      @@images_dir = app.config[:images_dir]
      @@build_dir = app.config[:build_dir]
      @@environment = app.config[:environment]
  end

  def after_build(builder)
    #Dir.glob(@@cache + "/**/*") do |item|
    #  puts item
    #end
    Find.find(@@cache) do |img|
      unless File.directory?(img)
        FileUtils.mv(img, img.gsub(@@cache, @@build_dir))
        builder.trigger(:created, img.gsub(@@cache, @@build_dir))
      end
    end

    FileUtils.rm_r @@cache

  end

  def self.abs_path(img_path)
    File.join(@@source_dir, middleman_abs_path(img_path))
  end

  def self.middleman_abs_path(img_path)
    img_path.start_with?('/') ? img_path : File.join(@@images_dir, img_path)
  end

  helpers do

    def create_image_thumb(image_path, resize_string)

      new_fname = image_path[0..-5] + "_" + resize_string + image_path [-4..-1] # yeah i know this is bad
      new_fname_cache = @@cache + ::DexterityThumbs.middleman_abs_path(new_fname)

      unless @@images.include?(new_fname)
       image = MiniMagick::Image.open(::DexterityThumbs.abs_path(image_path))
       image.resize(resize_string)
       FileUtils.mkdir_p(File.dirname(new_fname_cache))
       image.write(new_fname_cache)
       @@images << new_fname
      end

      if @@environment == :development
        return "data:#{image.mime_type};base64,#{Base64.strict_encode64(File.read(new_fname_cache))}"
      else
        return @@build_dir + new_fname
      end

    end


  end

  # helpers do
  #   def a_helper
  #   end
  # end
end

::Middleman::Extensions.register(:dexterity, DexterityThumbs)
