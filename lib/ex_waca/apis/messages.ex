defmodule ExWaca.APIs.Messages do
  @moduledoc """
  Documentation for `ExWaca.APIs.Messages`.
  """
  import ExWaca.Client

  def send_text(
    sender_id: sender_id, recipient_number: recipient_number, message: message
  ) do
    params = %{
      messaging_product: "whatsapp",
      to: recipient_number,
      recipient_type: "individual",
      type: "text",
      text: %{body: message},
    }

    send_request(sender_id, params)
  end

  def send_text(
    sender_id: sender_id, recipient_number: recipient_number, message: message, client: client
  ) do
    params = %{
      messaging_product: "whatsapp",
      to: recipient_number,
      recipient_type: "individual",
      type: "text",
      text: %{body: message},
    }

    send_request(sender_id, params, client)
  end

  def send_text(
    sender_id: sender_id, recipient_number: recipient_number, message: message,
    message_id: message_id
  ) do
    params = %{
      messaging_product: "whatsapp",
      to: recipient_number,
      recipient_type: "individual",
      type: "text",
      text: %{body: message},
      context: %{message_id: message_id},
    }

    send_request(sender_id, params)
  end

  def send_text(
    sender_id: sender_id, recipient_number: recipient_number, message: message,
    message_id: message_id, client: client
  ) do
    params = %{
      messaging_product: "whatsapp",
      to: recipient_number,
      recipient_type: "individual",
      type: "text",
      text: %{body: message},
      context: %{message_id: message_id},
    }

    send_request(sender_id, params, client)
  end

  defp send_request(sender_id, params) do
    client = ExWaca.Client.client
    client
      |> post("/#{sender_id}/messages", params)
  end

  defp send_request(sender_id, params, client) do
    client
      |> post("/#{sender_id}/messages", params)
  end
end
