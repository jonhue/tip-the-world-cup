Mozaic.configure do |config|

    # Use Mozaic with Webpacker
    # config.es6 = true
    # Javascript asset directory
    config.javascripts = 'app/webpack/javascripts'
    # Stylesheet asset directory
    config.stylesheets = 'app/webpack/stylesheets'

    # Define Mozaic components
    config.define_component :flag
    config.define_component :mobile

end
