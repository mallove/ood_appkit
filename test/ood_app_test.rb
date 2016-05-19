require 'test_helper'

class OodAppTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, OodApp
  end

  # FIXME: move these tests elsewhere
  #
  test "shell urls" do
    s = OodApp::ShellUrl.new(base_url: "/sh")

    assert_equal "/sh/ssh/default", s.url.to_s
    assert_equal "/sh/ssh/oakley", s.url(host: "oakley").to_s
    assert_equal "/sh/ssh/oakley", s.url(host: :oakley).to_s
    assert_equal "/sh/ssh/oakley/nfs/gpfs", s.url(host: :oakley, path: "/nfs/gpfs").to_s
    assert_equal "/sh/ssh/default/nfs/gpfs", s.url(path: "/nfs/gpfs").to_s
    assert_equal "/sh/ssh/default/nfs/gpfs", s.url(path: Pathname.new("/nfs/gpfs")).to_s
  end

  test "files urls" do
    f = OodApp::FilesUrl.new(base_url: "/f")

    assert_equal "/f/fs/nfs/17/efranz/ood_dev", f.url(path: "/nfs/17/efranz/ood_dev").to_s
    assert_equal "/f/fs/nfs/17/efranz/ood_dev", f.url(path: Pathname.new("/nfs/17/efranz/ood_dev")).to_s
  end

end
