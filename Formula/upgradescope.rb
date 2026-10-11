# typed: false
# frozen_string_literal: true

# Rendered by script/render-formula.sh from the checksums.txt of upgradescope
# release v0.2.1, after its keyless cosign signature was verified
# (.github/workflows/update.yml). Do not edit by hand: edit formula.rb.tmpl.
class Upgradescope < Formula
  desc "Kubernetes upgrade-readiness scanner: removed APIs, EOL add-ons, skew"
  homepage "https://github.com/abd-ulbasit/upgradescope"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.1/upgradescope_darwin_arm64.tar.gz"
      sha256 "317744ff94fe345175dbb355454b7d4bfee4a63b4a04334de7ea3e8e25b4de3b"
    end
    on_intel do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.1/upgradescope_darwin_amd64.tar.gz"
      sha256 "093e505c13058f0647a6b7025b3288f97ee8ee14818d616bfe147384741b29da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.1/upgradescope_linux_arm64.tar.gz"
      sha256 "d22a5c612a61c5f10cfa80e53b9d85cade4ca4c5ef730102c16557d44b5911ed"
    end
    on_intel do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.1/upgradescope_linux_amd64.tar.gz"
      sha256 "ea4b3d892cf6010cabf4b0312f5dd7863d62813242985ea93bdd0a7db1a38cbe"
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
