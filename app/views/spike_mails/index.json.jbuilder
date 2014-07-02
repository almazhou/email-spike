json.array!(@spike_mails) do |spike_mail|
  json.extract! spike_mail, :id
  json.url spike_mail_url(spike_mail, format: :json)
end
