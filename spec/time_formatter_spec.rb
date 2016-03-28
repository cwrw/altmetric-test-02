RSpec.describe(TimeFormatter) do
  it "formats a date range for different year" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2010-12-1"), nil, nil)
    expect(formatter.to_s).to eq("1st November 2009 - 1st December 2010")
  end

  it "formats a date range for different year with starting time" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2010-12-1"), "10:00", nil)
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 1st December 2010")
  end

  it "formats a date range for different year with ending time" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2010-12-1"), nil, "10:00")
    expect(formatter.to_s).to eq("1st November 2009 - 1st December 2010 at 10:00")
  end

  it "formats a date range for different year with starting and ending times" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2010-12-1"), "10:00", "11:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 1st December 2010 at 11:00")
  end
end

