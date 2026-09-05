class Keyit < Formula
  desc "Portable private state for software projects"
  homepage "https://github.com/simplbase/keyit"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simplbase/keyit/releases/download/v1.0.0/keyit-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "f7bb8bc38403452b373c1731a13485101689b89ff36893f04f69fdd7f7c1b60a"
    else
      url "https://github.com/simplbase/keyit/releases/download/v1.0.0/keyit-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "508fdb0d411ad8c1d813d90c5d597780492d838d405f0c343e62995dd8ed0076"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/simplbase/keyit/releases/download/v1.0.0/keyit-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "202e70401b3134a2816c3210da36aa1ab2aebb5e7d519c865f9741152e5dc342"
    end
  end

  def install
    bin.install "keyit"
    bin.install "keyit-relay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keyit version")
    assert_match version.to_s, shell_output("#{bin}/keyit-relay version")
  end
end
