case node[:platform]
when 'darwin'
  package 'reattach-to-user-namespace'
  package 'tmux'
else
  package 'tmux' do
    user 'root'
  end
end

dotfile '.tmux.conf'
