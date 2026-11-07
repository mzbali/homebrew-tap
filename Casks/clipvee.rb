cask "clipvee" do
  version "1.0.6"
  sha256 "0d22613daeb808c0a544b47d03ccfdbda39e2e98f3eee1df843f9052bfe6a807"

  url "https://github.com/mzbali/ClipVee/releases/download/v#{version}/ClipVee-#{version}.dmg"
  name "ClipVee"
  desc "Windows-style clipboard history"
  homepage "https://mzbali.github.io/ClipVee/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "ClipVee.app"

  zap trash: [
    "~/Library/Application Scripts/uk.co.mzbali.ClipVee",
    "~/Library/Containers/uk.co.mzbali.ClipVee",
  ]

  caveats <<~EOS
    ClipVee is not notarised by Apple, so the first time you open it macOS
    blocks it. Close the warning without deleting ClipVee, then open
      System Settings → Privacy & Security
    scroll down to Security, click Open Anyway and confirm. If Open Anyway
    isn't there, open ClipVee again first.

    To paste for you, ClipVee needs Accessibility access. Turn it on in
      System Settings → Privacy & Security → Accessibility
    Updates keep this setting.
  EOS
end
