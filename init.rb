require 'autoproj/gitorious'
if !Autoproj.has_source_handler? 'github'
    Autoproj.gitorious_server_configuration('GITHUB', 'github.com', :http_url => 'https://github.com')
end

# The GCCXML importer is not working on newer system. Even we do not support the clang officially  
# we enable it and hope it will work. This is better than having a completely broken setup.
only_on %w{ubuntu 15.10}, %w{debian testing}, %w{debian unstable} do
    configuration_option 'TYPELIB_IMPORTER', 'string',
        :default => 'clang',
        :possible_values => ['clang', 'gccxml'],
        :doc => [
                "WARNING: You are using a unsupported OS Version (Debian testing/unstable or Ubuntu 15.10).",
                "The default gccxml typelib importer is not useable anymore.",
                "You could use the clang importer which is highly experimental and unsupported.",
                "However, please select the generator you want to use."]

    Autoproj.env_set 'TYPELIB_CXX_LOADER', user_config('TYPELIB_IMPORTER') 
end

