module Helpers
    def self.autoproj_v2?
        Autoproj.respond_to?(:workspace)
    end

    def self.autoproj_env
        if autoproj_v2?
            Autoproj.workspace.env
        else
            ENV
        end
    end

    def self.autoproj_os_package_resolver
        if autoproj_v2?
            Autoproj.workspace.os_package_resolver
        else
            Autoproj.osdeps
        end
    end

    def self.autoproj_config
        Autoproj.config
    end
end

