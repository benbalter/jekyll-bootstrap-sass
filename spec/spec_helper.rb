$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'jekyll'
require 'fileutils'
require 'jekyll-bootstrap-sass'
require 'bootstrap/bootstrap'

TEST_DIR = File.dirname(__FILE__)
TMP_DIR  = File.expand_path('../tmp', TEST_DIR)

def tmp_dir(*files)
  File.join(TMP_DIR, *files)
end

def source_dir(*files)
  tmp_dir('source', *files)
end

def dest_dir(*files)
  tmp_dir('dest', *files)
end

def fixtures_dir
  File.expand_path './fixtures', TEST_DIR
end

def fixture_path(fixture)
  File.expand_path fixture, fixtures_dir
end

def add_fixture_to_source(fixture)
  FileUtils.cp fixture_path(fixture), source_dir(fixture)
end

def init_source_and_dest
  FileUtils.mkdir_p source_dir
  FileUtils.rm_rf dest_dir
end

def site(opts = {})
  defaults = Jekyll::Configuration::DEFAULTS
  opts = opts.merge(
    'source'      => source_dir,
    'destination' => dest_dir,
    'gems'        => ['jekyll-bootstrap-sass']
  )
  conf = Jekyll::Utils.deep_merge_hashes(defaults, opts)
  Jekyll::Site.new(conf)
end

def assets_rendered?
  js = dest_dir('assets/javascripts/bootstrap.js')
  font = dest_dir('assets/fonts/bootstrap/glyphicons-halflings-regular.ttf')
  File.exist?(js) && File.exist?(font)
end
