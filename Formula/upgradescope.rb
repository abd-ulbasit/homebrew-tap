# typed: false
# frozen_string_literal: true

# Rendered by script/render-formula.sh from the checksums.txt of upgradescope
# release v0.2.0, after its keyless cosign signature was verified
# (.github/workflows/update.yml). Do not edit by hand: edit formula.rb.tmpl.
class Upgradescope < Formula
  desc "Kubernetes upgrade-readiness scanner: removed APIs, EOL add-ons, skew"
  homepage "https://github.com/abd-ulbasit/upgradescope"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.0/upgradescope_darwin_arm64.tar.gz"
      sha256 "4865bd1a332e48c0cdc8486db4c7ccdf6e7598e3ea281bcdffe5913ab37f4c05"
    end
    on_intel do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.0/upgradescope_darwin_amd64.tar.gz"
      sha256 "5399214f5d411227109e28e7ada55ba7599c02049adaa51c0e20a191a4fa3d21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.0/upgradescope_linux_arm64.tar.gz"
      sha256 "821796b22a6e460ff97314817e622b9bc4e5ebf6e5ca4e78a702de422cab7863"
    end
    on_intel do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.0/upgradescope_linux_amd64.tar.gz"
      sha256 "f05ae6de13355ee8420958309ab6b429754aac1981ee5b41efe2aefb107d31a3"
    end
  end

  def install
    bin.install "upgradescope"
    # The archive's completions/ and manpages/ are rendered from the same
    # command tree; generating completions from the binary also covers
    # releases that predate them.
    generate_completions_from_executable(bin/"upgradescope", "completion")
    man1.install Dir["manpages/*.1.gz"]
  end

  test do
    assert_match "upgradescope #{version}", shell_output("#{bin}/upgradescope version")
  end
end
