defmodule ExWaca.Client do
  @moduledoc """
  Documentation for `ExWaca.Client`.
  """
  use Tesla

  @api_host "https://graph.facebook.com"
  @api_version "v16.0"
  @expected_fields ~w(
    contacts messages messaging_product
  )

  adapter Tesla.Adapter.Hackney
  plug Tesla.Middleware.BaseUrl, "#{@api_host}/#{@api_version}"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.FormUrlencoded,
    encode: &Plug.Conn.Query.encode/1,
    decode: &Plug.Conn.Query.decode/1
  plug Tesla.Middleware.Compression, format: "gzip"

  @doc """
  Get a Whatsapp Cloud API Client

  ## Examples

      iex> ExWaca.Client.client
      %Tesla.Client{
        adapter: nil,
        fun: nil,
        post: [],
        pre: [
          {Tesla.Middleware.BearerAuth, :call, [[token: "WHATSAPP_ACCESS_TOKEN"]]}
        ]
      }
  """
  def client do
    case from_env(:ex_waca, :access_token) do
      nil -> raise RuntimeError, "missing ENV WHATSAPP_ACCESS_TOKEN"
      "" -> raise RuntimeError, "missing ENV WHATSAPP_ACCESS_TOKEN"
      access_token -> client(access_token)
    end
  end

  def client(access_token) do
    case access_token do
      nil -> raise RuntimeError, "missing access token"
      "" -> raise RuntimeError, "missing access token"
      _ ->
        middleware = [
          {Tesla.Middleware.BearerAuth, token: access_token}
        ]
        Tesla.client(middleware)
    end
  end

  @doc """
  A light wrapper around `Application.get_env/2`, providing automatic support for
  `{:system, "VAR"}` tuples.
  """
  def from_env(otp_app, key, default \\ nil)

  def from_env(otp_app, key, default) do
    otp_app
    |> Application.get_env(key, default)
    |> read_from_system(default)
  end

  defp read_from_system({:system, env}, default), do: System.get_env(env) || default
  defp read_from_system(value, _default), do: value
end
