package tyovuoro.binder;

import java.beans.PropertyEditorSupport;
import tyovuoro.model.User;
import tyovuoro.service.UserService;

public class UserBinder extends PropertyEditorSupport {
    
    private final UserService us;
    
    public UserBinder(UserService us) {
        this.us = us;
    }
    
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        User user = us.getUser(text);
        setValue(user);
    }
}
