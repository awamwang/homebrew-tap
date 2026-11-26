# SPDX-License-Identifier: GPL-3.0-or-later
# Generated from awamwang/a-file-manager — do not edit by hand in the tap.
# Source: packaging/homebrew-tap/a-file-manager.rb.tmpl

cask "a-file-manager" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "0b217e480af0eeda6d4b6a1c9913b24f60eb912e057934a64939da42ad6a0d58",
         intel: "be77d67ae2691389883ce4a564e36b3cfbd97702d88f6112e040f00a17d3f0da"

  url "https://github.com/awamwang/a-file-manager/releases/download/v#{version}/A.File.Manager_#{version}_#{arch}.app.zip"
  name "A File Manager"
  desc "Cross-platform dual-pane file manager"
  homepage "https://github.com/awamwang/a-file-manager"

  app "A File Manager.app"

  # Ad-hoc signed build (no Developer ID / notarization): clear the download
  # quarantine after install so the first double-click works on macOS 15+.
  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/A File Manager.app"]
    end
  end

  uninstall quit: "com.a-file-manager.app"
end
