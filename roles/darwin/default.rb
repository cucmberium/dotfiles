include_role 'base'
include_cookbook 'homebrew'

node.reverse_merge!(
  rbenv: {
    global: 'system',
    versions: %w[
    ],
  },
  goenv: {
    global: 'system',
    versions: %w[
    ], 
  },
  pyenv: {
    global: 'system',
    versions: %w[
    ],
  },
)
include_recipe "rbenv::user"

include_cookbook 'git'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'pyenv'
include_cookbook 'goenv'
include_cookbook 'vim'
include_cookbook 'bin'

# keyrepeat
execute "defaults write -g InitialKeyRepeat -int 25" do
  not_if "[ $(defaults read -g InitialKeyRepeat) -eq 25 ]"
end

execute "defaults write -g KeyRepeat -int 2" do
  not_if "[ $(defaults read -g KeyRepeat) -eq 2 ]"
end
