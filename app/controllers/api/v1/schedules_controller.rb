class Api::V1::SchedulesController < ApplicationController
    # GET /api/v1/schedules
    def index
      # Veriyi optimize etmek için User ve Shift bilgilerini de 'preload' ediyoruz
      @schedules = Schedule.preload(:user, :shift) 
  
      # Veriyi Frontend'in istediği formatta gönderiyoruz
      render json: @schedules.map { |s|
        {
          id: s.id,
          date: s.date,
          user: s.user.username, # User'ın sadece username'ini gönder
          shift: s.shift.name   # Shift'in sadece adını gönder
        }
      }
    end
  
    # Diğer 'create' (oluşturma) metodunu şimdilik boş bırakabiliriz
  end