package tyovuoro.DAO;

import java.util.List;
import org.springframework.security.access.annotation.Secured;
import tyovuoro.model.Place;

public interface PlaceDAO {

    @Secured("isAuthenticated()")
    public Place getPlace(int id);

    @Secured("isAuthenticated()")
    public Place getPlace(String name);

    @Secured("hasRole('ROLE_MODERATOR')")
    public void editPlace(Place place);

    @Secured("hasRole('ROLE_MODERATOR')")
    public void addPlace(Place place);

    @Secured("hasRole('ROLE_MODERATOR')")
    public void deletePlace(int id);

    @Secured("isAuthenticated()")
    public List getAllPlaces();
}
