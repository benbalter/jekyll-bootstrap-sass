require 'spec_helper'

describe Jekyll::Bootstrap do
  let(:config) { {} }
  before(:each) do
    init_source_and_dest
    add_fixture_to_source 'style.scss'
    site(config).process
  end

  let(:stylesheet) { dest_dir('style.css') }
  let(:output) { File.open(stylesheet).read }

  it 'has a version number' do
    puts Bootstrap::VERSION
    expect(Jekyll::BootstrapSass::VERSION).not_to be nil
  end

  it 'outputs the stylesheet' do
    expect(File.exist?(stylesheet)).to eql(true)
  end

  # Confirm bootstrap made it into SaSS's load path
  it 'renders bootstrap' do
    regex = /Bootstrap v#{Regexp.escape(Bootstrap::VERSION)}/
    expect(output).to match(regex)
  end

  context 'rendering assets' do
    context 'with no config' do
      it "doesn't render assets" do
        expect(assets_rendered?).to_not eql(true)
      end
    end

    context 'with a config' do
      context 'with assets enabled' do
        let(:config) { { 'bootstrap' => { 'assets' => true } } }

        it 'renders assets' do
          expect(assets_rendered?).to eql(true)
        end
      end

      context 'with assets disabled' do
        let(:config) { { 'bootstrap' => { 'assets' => false } } }

        it "doesn't render assets" do
          expect(assets_rendered?).to_not eql(true)
        end
      end
    end
  end
end
