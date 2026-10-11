# typed: false
# frozen_string_literal: true

# Rendered by script/render-formula.sh from the checksums.txt of upgradescope
# release v0.2.2, after its keyless cosign signature was verified
# (.github/workflows/update.yml). Do not edit by hand: edit formula.rb.tmpl.
class Upgradescope < Formula
  desc "Kubernetes upgrade-readiness scanner: removed APIs, EOL add-ons, skew"
  homepage "https://github.com/abd-ulbasit/upgradescope"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.2/upgradescope_darwin_arm64.tar.gz"
      sha256 "a9a343d23745222cbcbaab7c8ed844222c911ac6dc909c9e443edf5735766b91"
    end
    on_intel do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.2/upgradescope_darwin_amd64.tar.gz"
      sha256 "9c1d7833d794f5f9c001b85cd2980bea3fae6f0f09e37f91b1e2222a4b367763"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.2/upgradescope_linux_arm64.tar.gz"
      sha256 "a1532e43e83d20e2b389af8799d73a9b33f1776e199cdf441456bcff6f7d22a5"
    end
    on_intel do
      url "https://github.com/abd-ulbasit/upgradescope/releases/download/v0.2.2/upgradescope_linux_amd64.tar.gz"
      sha256 "e4a849e8c8417e01ee8b4933d32e1f2b628dcbd7370af1ac84169e725d014acc"
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
