module ComentariosHelper

  # Opcion para mostrar comentarios:
  # 0 => Se mostraran solo 200 caracteres
  # 1 => Se mostrara todo el comentario
  # != de ( 0,1 ) => Se mostrara en blanco
  def mostrar_comentarios(comentario, opcion)

    html = ""
    unless comentario.nil?
      case opcion
      when 0
        # strip_tags => Clean all html
        html += strip_tags(comentario[0..200])

        Rails.logger.info(html)

        if html.length > 200
          html += "..."
        end
      when 1
        html = comentario
      else
        html = ''
      end

    end

    html.html_safe
  end

end
