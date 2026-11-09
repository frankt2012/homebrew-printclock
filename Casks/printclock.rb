cask "printclock" do
  version "1.1.0"
  sha256 "55716fa0c1434fa8ac2829f592158942dd933fca988f8d014c833cae5ce459c6"

  url "https://github.com/frankt2012/PrintClock/releases/download/v#{version}/PrintClock-#{version}.dmg"
  name "PrintClock"
  desc "3D print finish-time calculator for the macOS menu bar"
  homepage "https://github.com/frankt2012/PrintClock"

  depends_on macos: :sonoma

  app "PrintClock.app"

  postflight_steps do
    # The build is not notarized, so remove Homebrew's download quarantine to
    # let the cask install launch normally.
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "/Applications/PrintClock.app"]
  end

  caveats <<~EOS
    PrintClock is signed for local development and is not notarized.
    Homebrew removes the download quarantine for this cask. If you install
    from the DMG instead, right-click the app in Applications and choose Open.
  EOS
end
