class DevhelperCli < Formula
  desc "A comprehensive command-line interface for Shield operations"
  homepage "https://github.com/lirtsman/devhelper-cli"
  url "https://github.com/lirtsman/devhelper-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "d59b215e9fbc157706cf7f9ee56168137e4c5265fb00cb6828d7672c291ef8ca"
  
  depends_on "go" => :build

  def install
    # Get version information and truncate tag prefix "v"
    version_no_v = version.to_s.sub(/^v/, "")
    system "go", "build", 
           "-ldflags", "-X github.com/lirtsman/devhelper-cli/cmd.Version=#{version_no_v} -X github.com/lirtsman/devhelper-cli/cmd.BuildDate=#{Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")} -X github.com/lirtsman/devhelper-cli/cmd.Commit=6feea91f7408edf6c8d5d1f1f604e7d84cd615a5",
           "-o", "devhelper-cli"
    bin.install "devhelper-cli"
  end

  test do
    system "#{bin}/devhelper-cli", "--help"
  end
end
