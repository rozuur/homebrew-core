class Nifi < Formula
  desc "Easy to use, powerful, and reliable system to process and distribute data"
  homepage "https://nifi.apache.org"
  url "https://www.apache.org/dyn/closer.lua?path=/nifi/1.16.3/nifi-1.16.3-bin.tar.gz"
  mirror "https://archive.apache.org/dist/nifi/1.16.3/nifi-1.16.3-bin.tar.gz"
  sha256 "e7b66d80ad59f06fe75f6aed7fba2c9b29af13846e9068bb088bc2bd140d2ae1"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "9703d15a26e36641d3ea662f4921c8654dd08f096ea8eb3ebbcdae6b58005af4"
  end

  depends_on "openjdk@11"

  def install
    libexec.install Dir["*"]

    (bin/"nifi").write_env_script libexec/"bin/nifi.sh",
                                  Language::Java.overridable_java_home_env("11").merge(NIFI_HOME: libexec)
  end

  test do
    system bin/"nifi", "status"
  end
end
