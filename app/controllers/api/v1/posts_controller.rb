class Api::V1::PostsController < ApplicationController
    # GET /api/v1/posts
    # Tüm gönderileri listeler. Performans için ilişkili modelleri (User, Category, Tag) önyüklüyoruz (includes).
    def index
      @posts = Post.all.includes(:user, :category, :tags) 
      
      # JSON yanıtını render et, ilişkili verileri (User, Category, Tag) dahil et.
      render json: @posts, include: [:user, :category, :tags]
    end
  
    # GET /api/v1/posts/:id
    # Belirli bir gönderiyi detaylarıyla gösterir.
    def show
      @post = Post.find(params[:id])
      
      # Gönderinin yazarını, kategorisini, etiketlerini ve yorumlarını dahil et. 
      # Yorumların da yazarını (user) dahil et.
      render json: @post, include: [
        :user, 
        :category, 
        :tags, 
        comments: { 
          include: [:user] 
        }
      ]
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Gönderi bulunamadı" }, status: :not_found
    end
  end