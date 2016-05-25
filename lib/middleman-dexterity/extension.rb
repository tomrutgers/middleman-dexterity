# Require core library
require 'middleman-core'

# Extension namespace
class dexterity_thumbs < ::Middleman::Extension
  option :cache, 'cache/thumbs', 'default thumbnail cache directory for use in building'

  @@images = []

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
  end

  def after_configuration
    # Do something
  end

  def after_build(builder)
    #pass
  end

  # A Sitemap Manipulator
  # def manipulate_resource_list(resources)
  # end

  # helpers do
  #   def a_helper
  #   end
  # end
end

::Middleman::Extensions.register(:dexterity, dexterity_thumbs)
