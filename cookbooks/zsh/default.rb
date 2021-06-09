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

git File.join(ENV['HOME'], '.zinit/bin') do
  repository "https://github.com/zdharma/zinit.git"
end

dotfile '.zshenv'
dotfile '.zprofile'
dotfile '.zshrc'
dotfile '.zlogin'
dotfile '.zlogout'

dotfile '.zsh'

case node[:platform]
when 'darwin'
  execute "chsh -s /bin/zsh #{node[:user]}" do
    not_if "echo $SHELL | grep /bin/zsh"
  end
else
  execute "command -v zsh | sudo tee -a /etc/shells" do
    not_if "grep '^/home/#{node[:user]}/.linuxbrew/bin/zsh' /etc/shells"
  end

  execute "sudo chsh -s ~/.linuxbrew/bin/zsh #{node[:user]}" do
    not_if "echo $SHELL | grep ~/.linuxbrew/bin/zsh"
  end
end
