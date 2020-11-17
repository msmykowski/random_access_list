defmodule RandomAccessList.MixProject do
  use Mix.Project

  def project do
    [
      app: :random_access_list,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:benchee, "~> 1.0", only: :dev}
    ]
  end
end
