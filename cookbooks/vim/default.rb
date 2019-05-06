case node[:platform]
when 'darwin'
  package 'vim'
else
  package 'vim' do
    user 'root'
  end
end

dotfile '.vimrc'
dotfile '.vim'
