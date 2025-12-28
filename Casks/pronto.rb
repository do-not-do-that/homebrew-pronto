cask "pronto" do
  version "1.1.1"
  sha256 "17e80b5fc32ef49b7b8800e79a0446789151850910c3880cae7c236ba15b48cf"

  url "https://github.com/do-not-do-that/pronto/releases/download/v#{version}/Pronto-v#{version}.app.zip"
  name "Pronto"
  desc "AWS SSO profile switcher for macOS menu bar"
  homepage "https://github.com/do-not-do-that/pronto"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Pronto.app"

  zap trash: [
    "~/.pronto_profile",
    "~/.pronto_initialized",
    "~/Library/Preferences/com.donotdothat.pronto.Pronto.plist",
  ]

  caveats <<~EOS
    Pronto가 설치되었습니다!

    실행 전 Gatekeeper 경고를 제거하세요:
       $ xattr -cr /Applications/Pronto.app
       $ open -a Pronto

    사용 방법:
    1. AWS CLI v2가 설치되어 있는지 확인하세요
       $ aws --version

    2. ~/.aws/config에 SSO 설정이 있는지 확인하세요

    3. 메뉴바에서 ☁️ 아이콘을 클릭하고 Profile을 선택하세요

    문제 해결:
    - Profile이 보이지 않으면: ~/.aws/config 파일을 확인하세요
    - SSO 로그인이 안 되면: AWS CLI 설치를 확인하세요

    더 자세한 정보:
    https://github.com/do-not-do-that/pronto#readme
  EOS
end
