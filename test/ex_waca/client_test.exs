defmodule ExWaca.ClientTest do
  use ExUnit.Case
  doctest ExWaca.Client

  describe "with ENV WHATSAPP_ACCESS_TOKEN" do
    setup do
      previous_env = System.get_env()
      on_exit(fn -> System.put_env(previous_env) end)
    end

    test "raise Runtime error when ENV WHATSAPP_ACCESS_TOKEN is nil" do
      System.put_env(%{"WHATSAPP_ACCESS_TOKEN": nil})
      assert_raise RuntimeError, "missing ENV WHATSAPP_ACCESS_TOKEN", fn ->
        ExWaca.Client.client
      end
    end

    test "raise Runtime error when ENV WHATSAPP_ACCESS_TOKEN is empty" do
      System.put_env(%{"WHATSAPP_ACCESS_TOKEN": ""})
      assert_raise RuntimeError, "missing ENV WHATSAPP_ACCESS_TOKEN", fn ->
        ExWaca.Client.client
      end
    end
  end


  test "raise Runtime error when access_token is nil" do
    assert_raise RuntimeError, "missing access token", fn ->
      ExWaca.Client.client(nil)
    end
  end

  test "raise Runtime error when access_token is empty" do
    assert_raise RuntimeError, "missing access token", fn ->
      ExWaca.Client.client("")
    end
  end
end
