include_role 'base'

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
include_recipe "linuxbrew::user"

include_cookbook 'linuxbrew'
include_cookbook 'git'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'pyenv'
include_cookbook 'goenv'
include_cookbook 'vim'
include_cookbook 'bin'

