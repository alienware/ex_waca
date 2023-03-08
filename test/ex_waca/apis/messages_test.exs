defmodule ExWaca.APIs.MessagesTest do
  use ExUnit.Case
  doctest ExWaca.APIs.Messages

  def mocked_response do
    %{
      contacts: [%{
        input: "919876543210", wa_id: "919876543210"
      }],
      messages: [%{
        id: "wamid.abcdefghijklmnopqrstuvwxyz"
      }],
      messaging_product: "whatsapp"
    }
  end

  setup do
    Tesla.Mock.mock(fn
      %{method: :post} ->
        %Tesla.Env{
          status: 200,
          body: mocked_response(),
        }
    end)

    :ok
  end

  test "send text as standalone" do
    {:ok, response} = ExWaca.APIs.Messages.send_text(
      sender_id: 105046542515211, recipient_number: 919892690153, message: "Hello from ExWaca"
    )
    assert response.status == 200
    assert response.body == mocked_response()
  end

  test "send text as standalone with client" do
    client = ExWaca.Client.client("WHATSAPP_ACCESS_TOKEN")
    {:ok, response} = ExWaca.APIs.Messages.send_text(
      sender_id: 105046542515211, recipient_number: 919892690153, message: "Hello from ExWaca",
      client: client
    )
    assert response.status == 200
    assert response.body == mocked_response()
  end

  test "send text as reply" do
    {:ok, response} = ExWaca.APIs.Messages.send_text(
      sender_id: 1234567890, recipient_number: 919876543210, message: "Hello from ExWaca",
      message_id: "wamid.abcdefghijklmnopqrstuvwxyz"
    )
    assert response.status == 200
    assert response.body == mocked_response()
  end

  test "send text as reply with client" do
    client = ExWaca.Client.client("WHATSAPP_ACCESS_TOKEN")
    {:ok, response} = ExWaca.APIs.Messages.send_text(
      sender_id: 1234567890, recipient_number: 919876543210, message: "Hello from ExWaca",
      message_id: "wamid.abcdefghijklmnopqrstuvwxyz", client: client
    )
    assert response.status == 200
    assert response.body == mocked_response()
  end
end
