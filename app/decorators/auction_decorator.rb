class AuctionDecorator < Draper::Decorator
  delegate_all

  def title
    object.title.titleize
  end

  def reserve_price
    h.number_to_currency(object.reserve_price)
  end

  def current_price
    h.number_to_currency(object.current_price)
  end

  def end_date
    h.format_date_time(object.end_date)
  end

  def state_label
    bootstrap_classes = {"published" =>       "label-info",
                         "draft" =>           "label-default",
                         "reserve_met" =>     "label-success",
                         "reserve_not_met" => "label-danger",
                         "won" =>             "label-success",
                         "cancelled" =>       "label-danger"}
    h.content_tag :div, class: "label #{bootstrap_classes[object.aasm_state]}", id: "state" do
      object.aasm_state.titleize
    end
  end

  def publish_button
    if object.draft?
      h.link_to "Publish", h.auction_publishings_path(object), method: :post, class: "btn btn-primary", data: {confirm: "Are you sure you want to publish? You won't be able to edit the auction after it's published."}
    end
  end

end
