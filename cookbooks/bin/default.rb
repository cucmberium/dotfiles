include_recipe '../functions/default.rb'

# wget binaries
wget_binary 'fzf-tmux' do
  url 'https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux'
end

wget_binary 'digdag' do
  url 'https://dl.digdag.io/digdag-latest'
end

# github binaries
github_binary 'embulk' do
  version     'v0.11.5'
  repository  'embulk/embulk'
  archive     'embulk-0.11.5.jar'
  binary_path 'embulk-0.11.5.jar'
  extract     false
end

github_binary 'fzf' do
  version    'v0.61.1'
  repository 'junegunn/fzf'
  case node[:platform]
  when 'darwin'
    case node[:arch]
    when 'arm64'
      archive 'fzf-0.61.1-darwin_arm64.tar.gz'
    else
      raise 'not supported arch: ' + node[:arch]
    end
  when 'ubuntu'
    case node[:arch]
    when 'x86_64'
      archive 'fzf-0.61.1-linux_amd64.tar.gz'
    else
      raise 'not supported arch: ' + node[:arch]
    end
  else
    raise 'not supported platform: ' + node[:platform]
  end
end

github_binary 'jq' do
  version    'jq-1.7.1'
  repository 'jqlang/jq'
  case node[:platform]
  when 'darwin'
    archive     'jq-osx-amd64'
    binary_path 'jq-osx-amd64'
  when 'ubuntu'
    case node[:arch]
    when 'x86_64'
      archive     'jq-linux64'
      binary_path 'jq-linux64'
    else
      raise 'not supported arch: ' + node[:arch]
    end
  else
    raise 'not supported platform: ' + node[:platform]
  end
  extract false
end
