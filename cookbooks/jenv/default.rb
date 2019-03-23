git File.join(ENV['HOME'], '.jenv') do
  repository 'https://github.com/gcuisinier/jenv.git'
end

jenv_root = File.join(ENV['HOME'], '.jenv')
jenv_exe  = File.join(ENV['HOME'], '.jenv', 'bin', 'jenv')
jenv_env  = <<"EOS"
export JENV_ROOT=#{jenv_root}
eval \"$(#{jenv_exe} init -)\"
EOS

version_map = node[:jenv][:version_map] || {}
version_map.each do |v, path|
  execute "#{jenv_env}#{jenv_exe} add #{path}" do
    not_if "#{jenv_env}#{jenv_exe} versions --bare | grep #{v}"
  end
end

version_global = node[:jenv][:global]
execute "#{jenv_env}#{jenv_exe} global #{version_global}" do
  not_if "test -f #{jenv_root}/version && (cat #{jenv_root}/version | grep #{version_global})"
end
