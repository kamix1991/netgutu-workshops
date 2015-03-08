class UserDecorator < Draper::Decorator
  delegate_all

  def created_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime('%d-%m-%y')
    end
  end

  def last_sign_in_at
    helpers.content_tag :span, class: 'time' do
      object.last_sign_in_at ? object.last_sign_in_at.strftime('%d-%m-%y') : "-"
    end
  end

end
