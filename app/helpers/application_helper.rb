module ApplicationHelper

  def link(nombre, accion)
  end

  def buttons(nombre, ac, cl)
    button_to nombre, :action => ac, :class => cl
  end

  def buttons_back(nombre, ac, cl)
    button_to nombre, ac, class: cl
  end

end
