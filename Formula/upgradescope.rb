# typed: false
# frozen_string_literal: true

# Rendered by script/render-formula.sh from the checksums.txt of upgradescope
# release v0.3.0, after its keyless cosign signature was verified
# (.github/workflows/update.yml). Do not edit by hand: edit formula.rb.tmpl.
class Upgradescope < Formula
  desc "Kubernetes upgrade-readiness scanner: removed APIs, EOL add-ons, skew"
  homepage "https://github.com/abd-ulbasit/upgradescope"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.3.0/upgradescope_darwin_arm64.tar.gz"
      sha256 "91d3b5c1a98cc9b021cc770d8c1f3ca44d11237d7e3bc2b7bbb124bad3495b7f"
    end
    on_intel do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.3.0/upgradescope_darwin_amd64.tar.gz"
      sha256 "6aca800869aa3bf2d7f8891675ab7bd32bdb53d932b66159d4f79b089ee41249"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.3.0/upgradescope_linux_arm64.tar.gz"
      sha256 "10f701cf9edc5cda5f2a1c696f09cf54b42105d5cce2121a3ba6fe0bc7605d3a"
    end
    on_intel do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.3.0/upgradescope_linux_amd64.tar.gz"
      sha256 "a32b6c86a9b2d96001bf4d67234111ec58f45cf4ae059c7d0a8ec360b19237b7"
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
