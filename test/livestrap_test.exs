defmodule LivestrapTest do
  use ExUnit.Case

  test "use Livestrap imports all component modules" do
    # Verify the macro compiles and imports work
    defmodule TestModule do
      use Phoenix.Component
      use Livestrap

      def test_render(assigns) do
        ~H"""
        <.bs_button>Test</.bs_button>
        """
      end
    end

    assert function_exported?(TestModule, :test_render, 1)
  end
end
