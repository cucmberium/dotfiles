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
  version    '0.46.1'
  repository 'junegunn/fzf'
  case node[:platform]
  when 'darwin'
    case node[:arch]
    when 'arm64'
      archive 'fzf-0.46.1-darwin_arm64.zip'
    else
      raise 'not supported arch: ' + node[:arch]
    end
  when 'ubuntu'
    case node[:arch]
    when 'x86_64'
      archive 'fzf-0.46.1-linux_amd64.tar.gz'
    else
      raise 'not supported arch: ' + node[:arch]
    end
  else
    raise 'not supported platform: ' + node[:platform]
  end
end

github_binary 'jq' do
  version    'jq-1.7.1'
  repository 'stedolan/jq'
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
