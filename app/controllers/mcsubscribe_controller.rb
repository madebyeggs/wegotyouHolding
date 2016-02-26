class McsubscribeController < ApplicationController
 
  def index
  end
 
  def subscribe
    email = params[:email][:address]
    soundcloud = params[:soundcloud][:homepage]
    fname = params[:fname][:name]
    if !email.blank?
      begin
        @mc.lists.subscribe(@list_id, 
                           { "email" => email,
                             "soundcloud" => soundcloud,
                             "fname" => fname
                           })
        respond_to do |format|  
          format.json{render :json => {:message => "Thank you! Please check your email to confirm your sign up."}}
        end
        rescue Mailchimp::ListAlreadySubscribedError 
        respond_to do |format| 
          format.json{render :json => {:message => "The email address #{email} is already subscribed to the list"}}
        end
        rescue Mailchimp::ListDoesNotExistError
        respond_to do |format|  
          format.json{render :json => {:message => "Something has gone wrong! We've been notified of the error and are working to resolve it. Please try again later"}}
        end
        rescue Mailchimp::Error => ex
        if ex.message
          respond_to do |format|        
            format.json{render :json => {:message => "Please enter valid email id."}}
          end
        else
          respond_to do |format|        
            format.json{render :json => {:message => "Something has gone wrong! We've been notified of the error and are working to resolve it. Please try again later"}}
          end              
        end
      end
    else
      respond_to do |format|        
        format.json{render :json => {:message => "Please enter valid email address."}}
      end
    end
  end
 
end