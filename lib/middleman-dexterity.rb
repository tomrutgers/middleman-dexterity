require "middleman-core"

Middleman::Extensions.register :dexterity do
  require "middleman-dexterity/extension"
  DexterityThumbs
end
