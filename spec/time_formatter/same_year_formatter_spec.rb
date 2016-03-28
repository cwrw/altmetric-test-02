RSpec.describe(SameYearFormatter) do
  it "formats a date range for the same year" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-12-1"), nil, nil)
    expect(formatter.to_s).to eq("1st November - 1st December 2009")
  end

  it "formats a date range for the same year with starting time" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-12-1"), "10:00", nil)
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 1st December 2009")
  end

  it "formats a date range for the same year with ending time" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-12-1"), nil, "23:00")
    expect(formatter.to_s).to eq("1st November 2009 - 1st December 2009 at 23:00")
  end

  it "formats a date range for the same year with starting and ending times" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-12-1"), "10:00", "11:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 1st December 2009 at 11:00")
  end
end
