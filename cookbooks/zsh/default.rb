case node[:platform]
when 'darwin'
  package 'zsh'
else
  package 'language-pack-ja' do
    user 'root'
  end
  package 'language-pack-en' do
    user 'root'
  end
  package 'zsh' do
    user 'root'
  end
end

git File.join(ENV['HOME'], '.zinit') do
  repository "https://github.com/zdharma-continuum/zinit.git"
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
  execute "sudo chsh -s /bin/zsh #{node[:user]}" do
    not_if "echo $SHELL | grep /bin/zsh"
  end
end
