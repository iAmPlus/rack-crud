class RequestHandler
  include FooRequest
  include CRUDRequest

  def initialize env, params, url_params
    @env = env
    @params = params
    @url_params = url_params
  end

  def get_root
    Response.ok_for 'Your request was GET /'
  end

  def not_found
    # raise "Not found: #{ @env[ 'REQUEST_PATH' ]}"

    Response.not_found_for '404: There is no route for your request.'
  end

  def get_js
    Response.ok_for File.read( "public/js/#{ @url_params[ :file ]}" )
  end

  def get_js_vendor
    Response.ok_for File.read( "public/js/vendor/#{ @url_params[ :file ]}" )
  end

  def get_css_vendor
    Response.ok_for File.read( "public/css/vendor/#{ @url_params[ :file ]}" )
  end

  def render model, page, data
    content_template = File.read "templates/#{ model }/#{ page }.mustache"
    content = Mustache.render( content_template, { data:data })

    page_template = File.read( 'templates/layout.mustache' )
    Mustache.render page_template, { content:content }
  end
end