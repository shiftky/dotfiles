directory "#{ENV['HOME']}/.dotfiles/tmp" do
  not_if "test -e #{ENV['HOME']}/.dotfiles/tmp"
  action :create
end

if false
  execute "Install iterm2-japanesque" do
    command <<-EOF
      wget #{node[:iterm2_japanesque][:url]} -O #{ENV['HOME']}/.dotfiles/tmp/Japanesque.itermcolors
      open #{ENV['HOME']}/.dotfiles/tmp/Japanesque.itermcolors
    EOF
    not_if "test -e #{ENV['HOME']}/.dotfiles/tmp/Japanesque.itermcolors"
  end
end
