class SearchesService

  def engine(params, per_page, current_user)
    if params[:category_id].present?
      @category = Category.find params[:category_id]
      query = params[:query].present? ? params[:query] : "*"

      case @category.search_param
        when 'prelancamento' then
          if params[:process_description_selected].present?
            @scripts = Script.search query, where: {
                has_price: present?,
                status_id: [Status::PRE_LANCAMENTO_APROVADO],
                process_module_description: params[:process_description_selected].to_s,
            }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
          else
            @scripts = Script.search query, where: {
                has_price: present?,
                status_id: [Status::PRE_LANCAMENTO_APROVADO]
            }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
          end
        else
          if params[:process_description_selected].present?
            clausula_where = @category << query
            @scripts = Script.search clausula_where, where: {
                has_price: present?,
                status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO],
                process_module_description: params[:process_description_selected].to_s,
            }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
          else
            clausula_where = @category << query
            @scripts = Script.search clausula_where, where: {
                has_price: present?,
                status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO]
            }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
          end

      end

    else

      if params[:query].present?
        if params[:process_description_selected].present?
          @scripts = Script.search params[:query], where: {
              has_price: present?,
              status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO],
              process_module_description: params[:process_description_selected].to_s,
          }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
        else
          @scripts = Script.search params[:query], where: {
              has_price: present?,
              status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO]
          }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page

        end

      end
      unless params[:query].present?
        if params[:process_description_selected].present?
          @scripts = Script.search '*', where: {has_price: present?,
                                                status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO],
                                                process_module_description: params[:process_description_selected].to_s,
          }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
        else
          @scripts = Script.search '*', where: {
              has_price: present?,
              status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO]
          }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
        end
      end

    end

  end


end