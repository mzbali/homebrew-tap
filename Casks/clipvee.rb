cask "clipvee" do
  version "1.0.1"
  sha256 "718c7b8d6839d4c0308ba1bd4bec4d4d95684de87d533c026c432b2354a6bea3"

  url "https://github.com/mzbali/ClipVee/releases/download/v#{version}/ClipVee-#{version}.dmg"
  name "ClipVee"
  desc "Windows-style clipboard history"
  homepage "https://mzbali.github.io/ClipVee/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "ClipVee.app"

  zap trash: [
    "~/Library/Application Scripts/uk.co.mzbali.ClipVee",
    "~/Library/Containers/uk.co.mzbali.ClipVee",
  ]

  caveats <<~EOS
    ClipVee is not notarised by Apple. The first time you open it, go to
      System Settings → Privacy & Security
    and click Open Anyway.

    To paste for you, ClipVee needs Accessibility access. Turn it on in
      System Settings → Privacy & Security → Accessibility
    Updates keep this setting.
  EOS
end
