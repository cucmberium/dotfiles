execute "Install Homebrew" do
  command '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  not_if "which brew >/dev/null"
end

dotfile '.Brewfile'

execute "brew bundle --global" do
  not_if "brew bundle check --global"
end
