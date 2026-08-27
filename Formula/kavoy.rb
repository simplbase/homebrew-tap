class Kavoy < Formula
  desc "Portable private state for software projects"
  homepage "https://github.com/simplbase/kavoy"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/simplbase/kavoy/releases/download/v0.1.1/kavoy-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "87f32f94f29fc762e3bcff82c8065b44f74f84d92309db1cd2dd93ffaa77a04e"
    end

    on_intel do
      url "https://github.com/simplbase/kavoy/releases/download/v0.1.1/kavoy-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "9ebc789abe4d1224f94d158adc5b9a08ae193056980e1e22aa243120acdc8ec6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/simplbase/kavoy/releases/download/v0.1.1/kavoy-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f1bf77da5578d3431791d90333c25348c4ed48e609f311ebec3894f621ceba1"
    end
  end

  def install
    if File.exist?("kavoy")
      bin.install "kavoy"
      bin.install "kavoy-relay"
      return
    end

    release_dir = Dir["kavoy-*"].find { |path| File.directory?(path) }
    odie "release archive does not contain Kavoy binaries" unless release_dir

    bin.install "#{release_dir}/kavoy"
    bin.install "#{release_dir}/kavoy-relay"
  end

  test do
    assert_match "kavoy 0.1.1", shell_output("#{bin}/kavoy version")
    assert_match "kavoy-relay 0.1.1", shell_output("#{bin}/kavoy-relay version")
  end
end
