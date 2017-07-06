defmodule Reader.PersonTest do
  use Reader.ModelCase

  test "correctly maps data from comma-seperated files" do
    data = {:comma, ~w(Radican Shalonda Cat Turquoise 4/14/1945)}
    expectation = %Person{
      first:    "Shalonda",
      middle:   nil,
      last:     "Radican",
      pet:      "Cat",
      color:    "Turquoise",
      birthday: ~D[1945-04-14]
    }
    assert Person.new(data) == expectation
  end

  test "correctly maps data from pipe-seperated files" do
    data = {:pipe, ~w(Runyon Yoshie H Cat Red 10-15-1979)}
    expectation = %Person{
      first:    "Yoshie",
      middle:   "H",
      last:     "Runyon",
      pet:      "Cat",
      color:    "Red",
      birthday: ~D[1979-10-15]
    }
    assert Person.new(data) == expectation
  end

  test "correctly maps data from space-seperated files" do
    data = {:space, ~w(Doloris Cacioppo M C 12-9-1926 Red)}
    expectation = %Person{
      first:    "Doloris",
      middle:   "M",
      last:     "Cacioppo",
      pet:      "Cat",
      color:    "Red",
      birthday: ~D[1926-12-09]
    }
    assert Person.new(data) == expectation
  end

end
