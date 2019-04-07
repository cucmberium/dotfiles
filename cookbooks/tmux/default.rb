case node[:platform]
when 'darwin'
  package 'reattach-to-user-namespace'
end

package 'tmux'
dotfile '.tmux.conf'
