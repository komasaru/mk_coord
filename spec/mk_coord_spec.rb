require 'spec_helper'

describe MkCoord do
  it 'has a version number' do
    expect(MkCoord::VERSION).not_to be nil
  end

  context "#MkCoord" do
    let(:eps) { 23.43929 * MkCoord::Const::PI / 180.0 }
    let(:pos_rect) { [
       0.99443659220700997281,
      -0.03816291768957833647,
      -0.01655177670960058384
    ] }
    let(:pos_pol) { [
       6.24482770879939,
      -0.016630599800372015
    ] }
    let(:r) { 0.9951686008947793 }

    context ".rect_eq2ec" do
      subject { described_class.rect_eq2ec(pos_rect, eps) }
      it { expect(subject).to match([
        be_within(1.0e-14).of(0.99443659220701),
        be_within(1.0e-17).of(-0.04159771108146677),
        be_within(1.0e-21).of(-5.622172494390565e-06)
      ]) }
    end

    context ".rect_ec2eq" do
      subject { described_class.rect_ec2eq(pos_rect, eps) }
      it { expect(subject).to match([
        be_within(1.0e-14).of(0.99443659220701),
        be_within(1.0e-18).of(-0.028429874340125585),
        be_within(1.0e-18).of(-0.030366294535729515)
      ]) }
    end

    context ".pol_eq2ec" do
      subject { described_class.pol_eq2ec(pos_pol, eps) }
      it { expect(subject).to match([
        be_within(1.0e-15).of(6.241379248856413),
        be_within(1.0e-21).of(-5.648686087788284e-06)
      ]) }
    end

    context ".pol_ec2eq" do
      subject { described_class.pol_ec2eq(pos_pol, eps) }
      it { expect(subject).to match([
        be_within(1.0e-16).of(6.2546041659982015),
        be_within(1.0e-18).of(-0.030514234065205124)
      ]) }
    end

    context ".rect2pol" do
      subject { described_class.rect2pol(pos_rect) }
      it { expect(subject).to match([
        be_within(1.0e-14).of(6.24482770879939),
        be_within(1.0e-18).of(-0.016630599800372015)
      ]) }
    end

    context ".pol2rect" do
      subject { described_class.pol2rect(pos_pol, r) }
      it { expect(subject).to match([
        be_within(1.0e-16).of(0.9942990763065704),
        be_within(1.0e-17).of(0.01653731466084362),
        be_within(1.0e-17).of(-0.03816291768957855)
      ]) }
    end
  end
end
