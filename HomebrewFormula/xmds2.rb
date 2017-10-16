# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Xmds2 < Formula
  desc ""
  homepage ""
  url "https://downloads.sourceforge.net/project/xmds/xmds-2.2.3.tar.gz"
  sha256 "4363afe894c4eb322d6445ba53f3f124c9cde67937518d0b402f72fc82352924"

  # depends_on "cmake" => :build
  depends_on "open-mpi"
  depends_on "hdf5"
  depends_on "fftw" => "with-mpi"

  #resource "Cheetah3" do
  #  url "https://pypi.python.org/packages/5b/22/0238132792f3600717fad9647072486e2c15b7b45f845b52cc484b9af024/Cheetah3-3.0.0.tar.gz#md5=a1ec55881d2ceb58d6cc985d19ebf745"
  #  sha256 "53be5db7419e08d71b5b10c9cf0a722c4fd2f5f3aff63976fc22bd20db29f877"
  #end
  
  resource "Cheetah" do
    url "https://pypi.python.org/packages/cd/b0/c2d700252fc251e91c08639ff41a8a5203b627f4e0a2ae18a6b662ab32ea/Cheetah-2.4.4.tar.gz#md5=853917116e731afbc8c8a43c37e6ddba"
    sha256 "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
  end

  resource "pyparsing" do
    url "https://pypi.python.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz#md5=0214e42d63af850256962b6744c948d9"
    sha256 "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"
  end

  resource "mpmath" do
    url "https://pypi.python.org/packages/7a/05/b3d1472885d8dc0606936ea5da0ccb1b4785682e78ab15e34ada24aea8d5/mpmath-1.0.0.tar.gz#md5=998f10cb231af62743212ca80693f1b5"
    sha256 "04d14803b6875fe6d69e6dccea87d5ae5599802e4b1df7997bddd2024001050c"
  end

  include Language::Python::Virtualenv

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Install pypi dependencies
    virtualenv_install_with_resources
    system "#{bin}/xmds2", "--reconfigure"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test xmds`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
