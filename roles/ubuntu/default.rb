include_role 'base'

node.reverse_merge!(
  rbenv: {
    global: '2.5.0',
    versions: %w[
      2.5.0
    ],
  },
  goenv: {
    global: '1.11.2',
    versions: %w[
      1.11.2
    ], 
  },
  pyenv: {
    global: '3.5.2',
    versions: %w[
      3.5.2
      2.7.10
    ],
  },
  jenv: {
    global: '1.8',
    version_map: {
      '12' => '/Library/Java/JavaVirtualMachines/openjdk-12.jdk/Contents/Home',
      '1.8' => '/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home'
    },
  },
)
include_recipe "rbenv::user"
include_recipe "linuxbrew::user"

include_cookbook 'linuxbrew'
include_cookbook 'git'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'pyenv'
include_cookbook 'vim'
include_cookbook 'bin'

