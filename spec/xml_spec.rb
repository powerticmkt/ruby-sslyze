require 'spec_helper'
require 'xml_examples'
require 'sslyze/xml'

describe SSLyze::XML do
  include_examples "XML specs"

  describe ".parse" do
    it "should parse the contents of the file" do
    end
  end

  describe ".open" do
    it "should open the XML file" do
    end
  end

  describe "#version" do
    it "must parse the SSLyzeVersion attribute" do
      expect(subject.version).to match(/^1\.\d+\.\d+$/)
    end
  end

  describe "#network_timeout" do
    it "must parse the networkTimeout attribute" do
      expect(subject.network_timeout).to be == 5
    end
  end

  describe "#total_scan_time" do
    it "must parse the totalScanTime attribute" do
      expect(subject.total_scan_time).to be_kind_of(Float)
      expect(subject.total_scan_time).to be > 0.0
    end
  end

  describe "#invalid_targets" do
    subject { super().invalid_targets }

    it "should return an Array of Strings" do
      expect(subject).to be_an(Array).and(all(be_a(described_class::InvalidTarget)))
      expect(subject.size).to be == 2
    end
  end

  describe "#each_invalid_target" do
    it "should iterate over each invalid target element under results" do
      expect { |b|
        subject.each_invalid_target(&b)
      }.to yield_successive_args(
        described_class::InvalidTarget,
        described_class::InvalidTarget
      )
    end
  end

  describe "#targets" do
    it "should return an Array of Targets" do
      expect(subject.targets).to be_an(Array).and(all(be_a(described_class::Target)))
    end
  end

  describe "#target" do
    it "should return the first target" do
      expect(subject.target.host).to be == subject.targets.first.host
    end
  end
end
