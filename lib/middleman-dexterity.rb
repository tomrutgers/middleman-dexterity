require "middleman-core"
require "middleman-dexterity/extension"

Middleman::Extensions.register :dexterity do
  require "middleman-dexterity/extension"
  DexterityThumbs
end
