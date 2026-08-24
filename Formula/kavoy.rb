class Kavoy < Formula
  desc "Portable private state for software projects"
  homepage "https://github.com/simplbase/kavoy"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/simplbase/kavoy/releases/download/v0.1/kavoy-v0.1-aarch64-apple-darwin.tar.gz"
      sha256 "3bbf40a9b087cc22546487bdc9aed2d92efed6514d4b7c6b63ea8e1b75398521"
    end

    on_intel do
      url "https://github.com/simplbase/kavoy/releases/download/v0.1/kavoy-v0.1-x86_64-apple-darwin.tar.gz"
      sha256 "c5bd9228e57ad7261a7dca841f3adb5da9d5e0e2d3f4f2a02af5e7684d25c354"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/simplbase/kavoy/releases/download/v0.1/kavoy-v0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b7c751bdfc4555b1e50070e278ec7292b95bcc3d73715791ee05e8120b342da"
    end
  end

  def install
    release_dir = Dir["kavoy-*"].find { |path| File.directory?(path) }
    bin.install "#{release_dir}/kavoy"
    bin.install "#{release_dir}/kavoy-relay"
  end

  test do
    assert_match "kavoy 0.1.0", shell_output("#{bin}/kavoy version")
    assert_match "kavoy-relay 0.1.0", shell_output("#{bin}/kavoy-relay version")
  end
end
