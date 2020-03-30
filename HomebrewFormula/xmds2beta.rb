# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Xmds2beta < Formula
  desc ""
  homepage ""
  url "https://downloads.sourceforge.net/project/xmds/xmds2-beta.tar.gz"
  sha256 "bb0dc93ecd35c520f2b05c8b07e7fdcb4825a549ecef9a2358bcfd6b93807f70"

  # depends_on "cmake" => :build
  depends_on "python"
  depends_on "open-mpi"
  depends_on "libomp"
  depends_on "hdf5"
  depends_on "gsl"
  depends_on "fftw" => "with-mpi"
  
  
  # Apparently resources are the suggested way to install python libraries for homebrew.
  # Note that these seem to get installed in a virtual env tied to the xmds2 application, not
  # system wide. This means, for example, that pyparsing is not available to run the test suite
  # since that is run with ./run_tests and uses system python 3 (which *is* apparently available
  # since it is installed with depends_on above, so is now a system wide homebrew package)
  
  resource "Cheetah3" do
    url "https://pypi.python.org/packages/5b/22/0238132792f3600717fad9647072486e2c15b7b45f845b52cc484b9af024/Cheetah3-3.0.0.tar.gz#md5=a1ec55881d2ceb58d6cc985d19ebf745"
    sha256 "53be5db7419e08d71b5b10c9cf0a722c4fd2f5f3aff63976fc22bd20db29f877"
  end

  # This is Cheetah for python 2. Do not want
  #resource "Cheetah" do
  #  url "https://pypi.python.org/packages/cd/b0/c2d700252fc251e91c08639ff41a8a5203b627f4e0a2ae18a6b662ab32ea/Cheetah-2.4.4.tar.gz#md5=853917116e731afbc8c8a43c37e6ddba"
  #  sha256 "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
  #end

  resource "pyparsing" do
    url "https://pypi.python.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz#md5=0214e42d63af850256962b6744c948d9"
    sha256 "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"
  end

  resource "mpmath" do
    url "https://pypi.python.org/packages/7a/05/b3d1472885d8dc0606936ea5da0ccb1b4785682e78ab15e34ada24aea8d5/mpmath-1.0.0.tar.gz#md5=998f10cb231af62743212ca80693f1b5"
    sha256 "04d14803b6875fe6d69e6dccea87d5ae5599802e4b1df7997bddd2024001050c"
  end

  # We need numpy for matrix transforms like Hermite-Gauss, Bessel etc
  resource "numpy" do
    url "https://pypi.python.org/packages/04/b6/d7faa70a3e3eac39f943cc6a6a64ce378259677de516bd899dd9eb8f9b32/numpy-1.16.0.zip"
    sha256 "cb189bd98b2e7ac02df389b6212846ab20661f4bafe16b5a70a6f1728c1cc7cb"
  end

  # We need lxml to validate the XMDS2 XML scheme
  resource "lxml" do
    url "https://pypi.python.org/packages/16/4a/b085a04d6dad79aa5c00c65c9b2bbcb2c6c22e5ac341e7968e0ad2c57e2f/lxml-4.3.0.tar.gz"
    sha256 "d1e111b3ab98613115a208c1017f266478b0ab224a67bc8eac670fa0bad7d488"
  end

  # We need h5py for the testsuite
  #resource "h5py" do
  #  url "https://pypi.python.org/packages/43/27/a6e7dcb8ae20a4dbf3725321058923fec262b6f7835179d78ccc8d98deec/h5py-2.9.0.tar.gz"
  #  sha256 "9d41ca62daf36d6b6515ab8765e4c8c4388ee18e2a665701fef2b41563821002"
  #end

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
