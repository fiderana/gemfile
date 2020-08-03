require_relative '../lib/depute.rb'

page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721158"))

describe "get_depute_email method" do
  it "should return the mail of the depute profile" do
    expect(get_depute_email(page)).to eq("pieyre-alexandre.anglade@assemblee-nationale.fr") 
  end
  it "shouln't return nil or empty value" do
    expect(get_depute_email(page)).not_to eq(nil)
    expect(get_depute_email(page)).not_to eq("")
  end
end

describe "get_depute_first_name method" do
  it "should return the first name of the depute" do
    expect(get_depute_first_name(page)).to eq("Pieyre-Alexandre") 
  end

  it "shouln't return nil or empty value" do
    expect(get_depute_first_name(page)).not_to eq(nil)
    expect(get_depute_first_name(page)).not_to eq("")
  end
end

describe "get_depute_last_name method" do
  it "should return the last name of the depute" do
    expect(get_depute_last_name(page)).to eq("Anglade") 
  end
  
  it "shouln't return nil or empty value" do
    expect(get_depute_last_name(page)).not_to eq(nil)
    expect(get_depute_last_name(page)).not_to eq("")
  end
end

describe "get_urls_depute method" do
  it "should return an array of url" do
    expect(get_urls_depute()).to be_an_instance_of(Array)
    expect(get_urls_depute()).to include("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721158")
  end
end

describe "hash_depute method" do
  it "should return an hash with the depute information" do
    expect(hash_depute("Pieyre-Alexandre","Anglade","pieyre-alexandre.anglade@assemblee-nationale.fr")).to eq({"first_name"=>"Pieyre-Alexandre", "last_name"=>"Anglade", "email"=>"pieyre-alexandre.anglade@assemblee-nationale.fr"})
  end  

  it "shouldn't return an empty or nil hash" do
  expect(hash_depute("Pieyre-Alexandre","Anglade","pieyre-alexandre.anglade@assemblee-nationale.fr")).not_to eq({nil=>nil, nil=>nil, nil=>nil})
  end
end

