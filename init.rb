github_long_doc = [
    "Access method to github (https or ssh)",
    "Use 'ssh' only if you have a github account and have commit rights",
    "on the Orocos projects. Otherwise, we advise you to use 'https'"]

configuration_option 'GITHUB', 'string',
    :default => "https",
    :possible_values => ["https", "ssh"],
    :doc => github_long_doc do |value|

    if value == "https"
        Autoproj.change_option("GITHUB_ROOT", "https://github.com/")
    elsif value == "ssh"
        Autoproj.change_option("GITHUB_ROOT", "git@github.com:")
    end

    value
end

Autoproj.user_config('GITHUB')

