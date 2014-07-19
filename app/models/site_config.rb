class SiteConfig < Settingslogic
  source "#{Rails.root}/config/site_config.yml"
  namespace Rails.env
end