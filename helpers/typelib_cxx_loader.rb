module Helpers
    def self.typelib_cxx_loader_default(env: Helpers.autoproj_env, os_package_resolver: Helpers.autoproj_os_package_resolver, config: Helpers.autoproj_config)
        if cxx_loader_from_env = env['TYPELIB_CXX_LOADER']
            config.set('typelib_cxx_loader', cxx_loader_from_env)
        elsif !config.has_value_for?('typelib_cxx_loader') && os_package_resolver.has?('default_castxml')
            config.set 'typelib_cxx_loader', 'castxml'
        else
            config.set 'typelib_cxx_loader', 'gccxml'
        end
    end
end

