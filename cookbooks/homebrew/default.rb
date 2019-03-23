execute "Install Homebrew" do
  command 'yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  not_if "which brew >/dev/null"
end

dotfile '.Brewfile'

execute "brew bundle --global" do
  not_if "brew bundle check --global"
end
