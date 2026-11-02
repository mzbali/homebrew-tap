cask "clipvee" do
  version "1.0.4"
  sha256 "425be3cb46e02b272f7bd0f2970eaabf39cd95cad727c6ceae54110c45e6d161"

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
    ClipVee is not notarised by Apple. The first time you open it, go to
      System Settings → Privacy & Security
    and click Open Anyway.

    To paste for you, ClipVee needs Accessibility access. Turn it on in
      System Settings → Privacy & Security → Accessibility
    Updates keep this setting.
  EOS
end
