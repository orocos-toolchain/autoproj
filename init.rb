require 'autoproj/gitorious'
if !Autoproj.has_source_handler? 'gitorious'
    Autoproj.gitorious_server_configuration('GITORIOUS', 'gitorious.org')
end
if !Autoproj.has_source_handler? 'github'
    Autoproj.gitorious_server_configuration('GITHUB', 'github.com', :http_url => 'https://github.com')
end
