dotfile '.Brewfile' do
  source '.Brewfile.linux'
end

execute "eval $($HOME/.linuxbrew/bin/brew shellenv) && brew bundle --global" do
  not_if "eval $($HOME/.linuxbrew/bin/brew shellenv) && brew bundle check --global"
end
