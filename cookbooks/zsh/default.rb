package 'zsh'

git File.join(ENV['HOME'], '.zplug') do
  repository "https://github.com/zplug/zplug.git"
end

dotfile '.zshenv'
dotfile '.zprofile'
dotfile '.zshrc'
dotfile '.zlogin'
dotfile '.zlogout'

dotfile '.zsh'

execute "echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells" do
  not_if "grep '^/usr/local/bin/zsh' /etc/shells"
end

execute "chsh -s /usr/local/bin/zsh #{node[:user]}" do
  not_if "echo $SHELL | grep /usr/local/bin/zsh"
end

