ExUnit.start

defmodule User do
  defstruct email: nil, password: nil
end

defimpl String.Chars, for: User do
  def to_string(%User{email: email}) do
    email
  end
end

defmodule RecordTest do
  use ExUnit.Case

  defmodule ScopeTest do
    use ExUnit.Case

    require Record
    Record.defrecordp :person, first_name: nil, last_name: nil, age: nil

    test "defrecordp" do
      p = person(first_name: "Itanor", last_name: "Strapazzon", age: 3)  # regular function call
      assert p == {:person, "Itanor", "Strapazzon", 3}                  # just a tuple
    end
  end

  def sample do
    %User{email: "itanor@example.com", password: "pass"}  # special % syntax dor struct creation
  end

  test "defstruct" do
    assert sample == %{__struct__: User, email: "itanor@example.com", password: "pass"}
  end

  test "property" do
    assert sample.email == "itanor@example.com"
  end

  test "update" do
    u = sample()
    u2 = %User{u | email: "pedro@example.com"}
    assert u2 == %User{email: "pedro@example.com", password: "pass"}
  end

  test "protocol" do
    assert to_string(sample) == "itanor@example.com"
  end
end

