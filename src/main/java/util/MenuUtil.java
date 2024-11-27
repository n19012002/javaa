package util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Menu;

public class MenuUtil {
    public static List<Menu> buildMenuHierarchy(List<Menu> menus) {
        Map<Integer, Menu> menuMap = new HashMap<>();
        List<Menu> rootMenus = new ArrayList<>();

        // Đưa tất cả các mục menu vào một map để dễ dàng truy cập
        for (Menu menu : menus) {
            menuMap.put(menu.getId(), menu);
        }

        // Xây dựng cấu trúc phân cấp
        for (Menu menu : menus) {
            if (menu.getParentId() == 0) {
                // Nếu parentId là 0, đây là mục menu gốc
                rootMenus.add(menu);
            } else {
                // Nếu không, thêm mục menu này vào danh sách con của mục menu cha
                Menu parent = menuMap.get(menu.getParentId());
                if (parent != null) {
                    if (parent.getChildren() == null) {
                        parent.setChildren(new ArrayList<>());
                    }
                    parent.getChildren().add(menu);
                }
            }
        }

        return rootMenus;
    }
}