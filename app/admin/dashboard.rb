ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Offers" do
          ul do
            Offer.take(5).map do |offer|
              li link_to(offer.title, admin_offer_path(offer))
            end
          end
        end
      end

        column do
          panel "Recent languages" do
            ul do
              Language.take(5).map do |language|
                li link_to(language.language, admin_language_path(language))
              end
            end
          end
        end

      column do
        panel "Info" do
          para "Welcome Administrator."
        end
      end
    end
  end # content
end
