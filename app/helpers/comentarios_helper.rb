module ComentariosHelper

  # Opcion para mostrar comentarios:
  # 0 => Se mostraran solo 200 caracteres
  # 1 => Se mostrara todo el comentario
  def mostrar_comentarios(comentario, opcion)

    html = ''
    unless comentario.nil?
      case opcion
      when 0
        html += comentario[0..200]

        if comentario.length > 200
          html += '...'
        end
      when 1
        html += comentario
      else
        html += ''
      end

    end

    html.html_safe
  end

end
