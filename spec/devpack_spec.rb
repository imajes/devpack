# frozen_string_literal: true

RSpec.describe Devpack do
  it 'has a version number' do
    expect(Devpack::VERSION).not_to be nil
  end

  describe '.warn' do
    it 'calls Kernel.warn with a prefix' do
      expect(Kernel).to receive(:warn).with('[devpack] a warning message')
      described_class.warn('a warning message')
    end

    it 'prefixes multiple lines' do
      expect(Kernel).to receive(:warn).with("[devpack] line1\n[devpack] line2\n[devpack] line3")
      described_class.warn("line1\nline2\nline3")
    end
  end

  describe '.debug?' do
    subject { described_class.debug? }

    context 'debug not enabled' do
      before { stub_const('ENV', {}) }
      it { is_expected.to be false }
    end

    context 'debug enabled' do
      before { stub_const('ENV', ENV.to_h.merge('DEVPACK_DEBUG' => '1')) }
      it { is_expected.to be true }
    end
  end

  describe '.disabled?' do
    subject { described_class.disabled? }

    context 'disabled not enabled' do
      before { stub_const('ENV', {}) }
      it { is_expected.to be false }
    end

    context 'disabled enabled' do
      before { stub_const('ENV', ENV.to_h.merge('DEVPACK_DISABLE' => '1')) }
      it { is_expected.to be true }
    end
  end
end
