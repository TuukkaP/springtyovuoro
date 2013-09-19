package tyovuoro.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tyovuoro.DAO.PlaceDAO;
import tyovuoro.model.Place;
import tyovuoro.model.User;

@Service
@Transactional(readOnly = true)
public class PlaceServiceImpl implements PlaceService {

    @Autowired
    private PlaceDAO placeDAO;
    
    @Autowired
    private UserService userService;

    @Override
    public Place getPlace(int id) {
        return placeDAO.getPlace(id);
    }

    @Override
    public Place getPlace(String name) {
        return placeDAO.getPlace(name);
    }

    @Override
    @Transactional(readOnly = false)
    public void editPlace(Place place) {
        placeDAO.editPlace(place);
    }

    @Override
    @Transactional(readOnly = false)
    public void addPlace(Place place) {
        placeDAO.addPlace(place);
    }

    @Override
    @Transactional(readOnly = false)
    public void deletePlace(int id) {
        placeDAO.deletePlace(id);
    }

    @Override
    public List getAllPlaces() {
        return placeDAO.getAllPlaces();
    }

    @Override
    public Set getBannedUsers(String place) {
        return placeDAO.getPlace(place).getBannedUsers();
    }

    @Override
    public List getValidUsers(String place) {
        List l = userService.getAllUsers();
        Set s = getBannedUsers(place);
        Iterator it = s.iterator();
        while (it.hasNext()) {
            l.remove(it.next());
        }
        return l;
    }
    
    
}
