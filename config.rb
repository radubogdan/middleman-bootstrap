###
# Compass
###

# Susy grids in Compass
require 'susy'

# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page command
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end
# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do

end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :relative_assets
  # activate :favicon_maker,
    # :favicon_maker_base_image => "favicon_base.svg"
end
  
activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.host   = "www.example.com"
  deploy.user   = "example"
  deploy.path   = "/public_html"
  # Optional Settings
  deploy.port  = 22
  deploy.clean = true
  deploy.build_before = true
end

