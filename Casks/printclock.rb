cask "printclock" do
  version "1.0.0"
  sha256 "5b7a8488273963809c469db74b3da111fafe913a749710592e5f7bcefa18a15a"

  url "https://github.com/frankt2012/PrintClock/releases/download/v#{version}/PrintClock-#{version}.dmg"
  name "PrintClock"
  desc "3D print finish-time calculator for the macOS menu bar"
  homepage "https://github.com/frankt2012/PrintClock"

  depends_on macos: :sonoma

  app "PrintClock.app"

  postflight do
    # The build is not notarized, so remove Homebrew's download quarantine to
    # let the cask install launch normally.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PrintClock.app"],
                   sudo: false
  end

  caveats <<~EOS
    PrintClock is signed for local development and is not notarized.
    Homebrew removes the download quarantine for this cask. If you install
    from the DMG instead, right-click the app in Applications and choose Open.
  EOS
end
