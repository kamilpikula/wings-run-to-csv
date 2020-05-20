defmodule WingsForLife.Progress do

  @spec render(number, number) :: :ok
  def render(value1, value2) do
    format = [
      bar: ":",
      suffix: :count
    ]
    ProgressBar.render(value1, value2, format)
  end
end
