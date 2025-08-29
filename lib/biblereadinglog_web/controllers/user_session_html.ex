defmodule BiblereadinglogWeb.UserSessionHTML do
  use BiblereadinglogWeb, :html

  embed_templates "user_session_html/*"

  defp local_mail_adapter? do
    Application.get_env(:biblereadinglog, Biblereadinglog.Mailer)[:adapter] == Swoosh.Adapters.Local
  end
end
