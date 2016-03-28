RSpec.describe(SameTimeFormatter) do
  it "formats a date range for the same day" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-11-1"), nil, nil)
    expect(formatter.to_s).to eq("1st November 2009")
  end

  it "formats a date range for the same day with starting time" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-11-1"), "10:00", nil)
    expect(formatter.to_s).to eq("1st November 2009 at 10:00")
  end

  it "formats a date range for the same day with ending time" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-11-1"), nil, "14:00")
    expect(formatter.to_s).to eq("1st November 2009 until 14:00")
  end

  it "formats a date range for the same day with starting and ending times" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-11-1"), "10:00", "11:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 to 11:00")
  end
end

