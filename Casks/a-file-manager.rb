# SPDX-License-Identifier: GPL-3.0-or-later
# Generated from awamwang/a-file-manager — do not edit by hand in the tap.
# Source: packaging/homebrew-tap/a-file-manager.rb.tmpl

cask "a-file-manager" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "da6e55d291119def33d3f6fd0e8d9da90b8ce6b282d47832e37879bfe9ec6117",
         intel: "ac1227d199202abe9cd324a5142dd626d6e24040c838cece252490dd27c47c28"

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
