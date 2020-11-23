defmodule RandomAccessList.MixProject do
  use Mix.Project

  def project do
    [
      app: :random_access_list,
      version: "0.1.0",
      elixir: "~> 1.11",
      description: description(),
      package: package(),
      source_url: "https://github.com/msmykowski/random_access_list",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    """
    A random access list is a list data structure that has O(log n) time lookups and updates,
    while maintaining a constant time for cons, tail and head operations.
    """
  end

  defp deps do
    [
      {:benchee, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      name: "random_access_list",
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Michael Smykowski"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/msmykowski/random_access_list"}
    ]
  end
end
