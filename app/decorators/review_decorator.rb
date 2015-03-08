class ReviewDecorator < Draper::Decorator
  delegate_all

  def author 
  	"#{user.firstname} #{user.lastname}"
  end

  def created_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime('%d-%m-%y')
    end
  end

end
