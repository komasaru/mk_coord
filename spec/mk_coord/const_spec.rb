require "spec_helper"

describe MkCoord::Const do
  context "PI" do
    it { expect(MkCoord::Const::PI).to be_within(1.0e-21).of(3.141592653589793238462) }
  end

  context "PI2" do
    let(:pi) { 3.141592653589793238462 }
    it { expect(MkCoord::Const::PI2).to be_within(1.0e-21).of(pi * 2) }
  end

  context "R_UNIT" do
    it { expect(MkCoord::Const::R_UNIT).to match([
      [1.0, 0.0, 0.0],
      [0.0, 1.0, 0.0],
      [0.0, 0.0, 1.0]
    ]) }
  end
end

