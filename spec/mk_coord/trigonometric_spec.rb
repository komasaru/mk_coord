require "spec_helper"

describe MkCoord::Trigonometric do
  context ".compute_lambda" do
    subject do
      compute_lambda(
        6.24482770879939,
        -0.016630599800372015,
        0.4090927848297817
      )
    end
    it { expect(subject).to be_within(1.0e-15).of(6.241379248856413) }
  end

  context ".compute_beta" do
    subject do
      compute_beta(
        6.24482770879939,
        -0.016630599800372015,
        0.4090927848297817
      )
    end
    it { expect(subject).to be_within(1.0e-21).of(-5.648686087788284e-06) }
  end

  context ".compute_alpha" do
    subject do
      compute_alpha(
        6.24482770879939,
        -0.016630599800372015,
        0.4090927848297817
      )
    end
    it { expect(subject).to be_within(1.0e-16).of(6.2546041659982015) }
  end

  context ".compute_delta" do
    subject do
      compute_delta(
        6.24482770879939,
        -0.016630599800372015,
        0.4090927848297817
      )
    end
    it { expect(subject).to be_within(1.0e-18).of(-0.030514234065205124) }
  end
end

