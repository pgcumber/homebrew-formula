class Pgcumber < Formula
  desc "Use Gherkin to write plain-text, human-readable test cases for your PostgreSQL data."
  homepage "https://github.com/arkadiusjonczek/pgcumber"
  
  url "https://github.com/arkadiusjonczek/pgcumber.git",
      tag:      "0.3.2",
      revision: "7e33e735d81a188066ea87b903871a7c18ad3599"
  
  license "MIT"
  depends_on "go" => :build
  
  def install
    system "go", "build", *std_go_args(output: bin/"pgcumber", ldflags: :goreleaser), "./cmd/pgcumber"
  end

  test do
    assert_match "pgcumber", shell_output("#{bin}/pgcumber --version", 1)
  end
end
