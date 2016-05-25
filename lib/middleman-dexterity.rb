require "middleman-core"

Middleman::Extensions.register :middleman-dexterity do
  require "my-extension/extension"
  MyExtension
end
