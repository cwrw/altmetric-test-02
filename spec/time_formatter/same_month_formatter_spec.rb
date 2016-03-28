RSpec.describe(SameMonthFormatter) do
  it "formats a date range for the same month" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-11-3"), nil, nil)
    expect(formatter.to_s).to eq("1st - 3rd November 2009")
  end

  it "formats a date range for the same month with starting time" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-11-3"), "10:00", nil)
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 3rd November 2009")
  end

  it "formats a date range for the same month with ending time" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-11-3"), nil, "22:00")
    expect(formatter.to_s).to eq("1st November 2009 - 3rd November 2009 at 22:00")
  end

  it "formats a date range for the same month with starting and ending times" do
    formatter = described_class.new(Date.parse("2009-11-1"), Date.parse("2009-11-3"), "10:00", "11:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 3rd November 2009 at 11:00")
  end
end
