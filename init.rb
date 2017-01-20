require 'autoproj/gitorious'
if !Autoproj.has_source_handler? 'github'
    Autoproj.gitorious_server_configuration('GITHUB', 'github.com', :http_url => 'https://github.com')
end

cxx_loader_from_env =
    if Autoproj.respond_to?(:workspace)
        Autoproj.workspace.env['TYPELIB_CXX_LOADER']
    else ENV['TYPELIB_CXX_LOADER']
    end
if cxx_loader_from_env
    Autoproj.config.set('typelib_cxx_loader', cxx_loader_from_env)
end

