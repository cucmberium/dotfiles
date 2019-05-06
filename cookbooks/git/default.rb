case node[:platform]
when 'darwin'
  package 'git'
else
  package 'git' do
    user 'root'
  end
end

dotfile '.gitconfig'
dotfile '.gitignore'
