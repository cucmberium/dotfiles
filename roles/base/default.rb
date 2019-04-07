
include_cookbook 'functions'

[
  "#{ENV['HOME']}/bin",
  "#{ENV['HOME']}/.config",
].each do |dir|
  directory dir do
    owner node[:user]
  end
end

