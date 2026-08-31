class Kavoy < Formula
  desc "Portable private state for software projects"
  homepage "https://github.com/simplbase/kavoy"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/simplbase/kavoy/releases/download/v0.2.0/kavoy-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "feff9fc55af2a4eb152ab2770a2ba8b5238910bf8311e18a8b0af7c2de43a002"
    end

    on_intel do
      url "https://github.com/simplbase/kavoy/releases/download/v0.2.0/kavoy-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "7ff152da15ac659f8ae631174dc09776895219ef55826cfcb765b072c8da3370"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/simplbase/kavoy/releases/download/v0.2.0/kavoy-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8442be877bc38e8fbc3661baad75dc3322decfb6a9594a2e9aa0c8c56103a70"
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
    assert_match "kavoy 0.2.0", shell_output("#{bin}/kavoy version")
    assert_match "kavoy-relay 0.2.0", shell_output("#{bin}/kavoy-relay version")
  end
end
