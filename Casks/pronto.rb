cask "pronto" do
  version "1.0.0"
  sha256 :no_check  # GitHub Release 생성 후 실제 SHA256으로 교체

  url "https://github.com/YOUR_USERNAME/pronto/releases/download/v#{version}/Pronto.app.zip"
  name "Pronto"
  desc "AWS SSO profile switcher for macOS menu bar"
  homepage "https://github.com/YOUR_USERNAME/pronto"

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

    사용 방법:
    1. AWS CLI v2가 설치되어 있는지 확인하세요
       $ aws --version

    2. ~/.aws/config에 SSO 설정이 있는지 확인하세요

    3. Pronto를 실행하세요
       $ open -a Pronto

    4. 메뉴바에서 ☁️ 아이콘을 클릭하고 Profile을 선택하세요

    문제 해결:
    - Profile이 보이지 않으면: ~/.aws/config 파일을 확인하세요
    - SSO 로그인이 안 되면: AWS CLI 설치를 확인하세요

    더 자세한 정보:
    https://github.com/YOUR_USERNAME/pronto#readme
  EOS
end
