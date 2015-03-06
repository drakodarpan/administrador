module ComentariosHelper

  def mostrar_comentarios(comentario)

    html = '<div>'
    unless comentario.empty?
      html += comentario[0..30]

      if comentario.length > 30
        html += '...'
      end

    end

    html += '</div> <br>'
    html.html_safe
  end

end
