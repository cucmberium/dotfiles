case node[:platform]
when 'darwin'
  package 'zsh'
else
  package 'language-pack-ja' do
    user 'root'
  end
  package 'zsh' do
    user 'root'
  end
end

git File.join(ENV['HOME'], '.zplug') do
  repository "https://github.com/zplug/zplug.git"
end

dotfile '.zshenv'
dotfile '.zprofile'
dotfile '.zshrc'
dotfile '.zlogin'
dotfile '.zlogout'

dotfile '.zsh'

case node[:platform]
when 'darwin'
  execute "echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells" do
    not_if "grep '^/usr/local/bin/zsh' /etc/shells"
  end

  execute "chsh -s /usr/local/bin/zsh #{node[:user]}" do
    not_if "echo $SHELL | grep /usr/local/bin/zsh"
  end
else
  execute "command -v zsh | sudo tee -a /etc/shells" do
    not_if "grep '^/home/#{node[:user]}/.linuxbrew/bin/zsh' /etc/shells"
  end

  execute "sudo chsh -s ~/.linuxbrew/bin/zsh #{node[:user]}" do
    not_if "echo $SHELL | grep ~/.linuxbrew/bin/zsh"
  end
end
