require "middleman-core"
require "middleman-dexterity/version"

Middleman::Extensions.register :dexterity do
  require "middleman-dexterity/extension"
  DexterityThumbs
end
