class Pgmagick < Formula
  desc "yet another boost-python based wrapper for GraphicsMagick"
  homepage "https://pypi.python.org/pypi/pgmagick/"
  url "https://github.com/hhatto/pgmagick/archive/ver0.6.5.tar.gz"
  sha256 "33c19044c24c100d3d0df2e9d8d2254955e9869e23740e004800655c1826839d"

  option "with-python3", "support python3"
  depends_on "python3" => :optional

  ## not support yet
  # option "with-imagemagick", "Build with ImageMagick"

  depends_on :python if MacOS.version <= :snow_leopard
  depends_on "graphicsmagick"
  # depends_on 'boost' => ['with-thread-unsafe', 'build-from-source']
  if build.with? "python3"
    depends_on "boost-python" => ["with-python3"]
  else
    depends_on "boost-python"
  end

  ## not support yet
  # if build.with? "imagemagick"
  #   puts "img"
  #   depends_on 'imagemagick'
  # else
  #   depends_on 'graphicsmagick'
  # end

  def install
    if build.with? "python3"
      ENV.prepend_create_path "PYTHONPATH", "#{lib}/python3.6/site-packages"
      system "python3", "setup.py", "install", "--prefix=#{prefix}"
    else
      ENV.prepend_create_path "PYTHONPATH", "#{lib}/python2.7/site-packages"
      system "python", "setup.py", "install", "--prefix=#{prefix}"
    end
  end
end
