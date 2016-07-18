class MessengerController < Messenger::MessengerController
  def webhook
    #logic here
    render :prueba
    # render nothing: true, status: 200
  end
end
