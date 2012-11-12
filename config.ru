require 'rack/contrib/try_static'
require 'rack/rewrite'

use Rack::Rewrite do
  r301 %r{^/geekblog/scribbishwp/?$}, 'http://geek.pittcrew.net/scribbishwp/'
  r301 %r{^/projects/(\S*)$}, 'http://download.pittcrew.net/projects/$1'
end

use Rack::TryStatic,
    :root => "_site",
    :urls => %w[/],
    :try => ['.html', 'index.html', '/index.html']

run lambda { [404, {'Content-Type' => 'text/html'}, ['Not Found']]}
