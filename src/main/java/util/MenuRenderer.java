package util;

import java.util.List;
import model.Menu;

public class MenuRenderer {
    public static String renderMenu(List<Menu> menus) {
        StringBuilder html = new StringBuilder();
        for (Menu menu : menus) {
            html.append("<li class=\"nav-item ")
                .append((menu.getChildren() != null && !menu.getChildren().isEmpty()) ? "submenu dropdown" : "")
                .append("\">")
                .append("<a href=\"").append(menu.getUrl() != null ? menu.getUrl() : "#").append("\" class=\"nav-link ")
                .append((menu.getChildren() != null && !menu.getChildren().isEmpty()) ? "dropdown-toggle" : "")
                .append("\" ")
                .append((menu.getChildren() != null && !menu.getChildren().isEmpty()) ? "data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'" : "")
                .append(">")
                .append(menu.getName())
                .append("</a>");
            if (menu.getChildren() != null && !menu.getChildren().isEmpty()) {
                html.append("<ul class=\"dropdown-menu\">")
                    .append(renderMenu(menu.getChildren()))
                    .append("</ul>");
            }
            html.append("</li>");
        }
        return html.toString();
    }
}