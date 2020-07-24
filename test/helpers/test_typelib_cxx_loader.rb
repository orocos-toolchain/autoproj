require 'test/helpers'
require 'helpers/typelib_cxx_loader'

describe Helpers do
    before do
        @config = Autoproj::Configuration.new
        Autoproj.workspace.env.clear 'TYPELIB_CXX_LOADER'
    end

    describe "selection by environment variable" do
        it "sets from the TYPELIB_CXX_LOADER environment" do
            Autoproj.env_set 'TYPELIB_CXX_LOADER', 'test'
            Helpers.typelib_cxx_loader_default(config: @config)
            assert_equal 'test', @config.get('typelib_cxx_loader')
        end
        it "overrides an existing configuration from the TYPELIB_CXX_LOADER environment" do
            @config.set 'typelib_cxx_loader', 'gccxml'
            Autoproj.env_set 'TYPELIB_CXX_LOADER', 'test'
            Helpers.typelib_cxx_loader_default(config: @config)
            assert_equal 'test', @config.get('typelib_cxx_loader')
        end
    end

    describe "defaults" do
        it "selects gccxml if the default_castxml entry in the os package resolver is nonexistent" do
            resolver = Autoproj::OSPackageResolver.new \
                'default_castxml' => { 'ubuntu' => { '12.04' => 'nonexistent', 'default' => 'ignore' } },
                operating_system: [['ubuntu', 'debian'], ['12.04', 'default']]
            Helpers.typelib_cxx_loader_default(config: @config, os_package_resolver: resolver)
            assert_equal 'gccxml', @config.get('typelib_cxx_loader')
        end
        it "selects castxml if the default_castxml entry in the os package resolver is ignore" do
            resolver = Autoproj::OSPackageResolver.new \
                'default_castxml' => { 'ubuntu' => { '12.04' => 'nonexistent', 'default' => 'ignore' } },
                operating_system: [['ubuntu', 'debian'], ['13.04', 'default']]
            Helpers.typelib_cxx_loader_default(config: @config, os_package_resolver: resolver)
            assert_equal 'castxml', @config.get('typelib_cxx_loader')
        end
    end
end
