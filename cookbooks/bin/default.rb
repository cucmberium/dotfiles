include_recipe '../functions/default.rb'

# wget binaries
wget_binary 'fzf-tmux' do
  url 'https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux'
end

wget_binary 'embulk' do
  url 'https://dl.embulk.org/embulk-latest.jar'
end

wget_binary 'digdag' do
  url 'https://dl.digdag.io/digdag-latest'
end

# github binaries
github_binary 'fzf' do
  version    '0.18.0'
  repository 'junegunn/fzf-bin'
  case node[:platform]
  when 'darwin'
    archive  'fzf-0.18.0-darwin_amd64.tgz'
  when 'ubuntu'
    archive  'fzf-0.18.0-linux_amd64.tgz'
  else
    raise 'not supported now'
  end
end

github_binary 'jq' do
  version     'jq-1.5'
  repository  'stedolan/jq'
  case node[:platform]
  when 'darwin'
    archive     'jq-osx-amd64'
    binary_path 'jq-osx-amd64'
  when 'ubuntu'
    archive     'jq-linux64'
    binary_path 'jq-linux64'
  else
    raise 'not supported now'
  end
  extract     false
end
